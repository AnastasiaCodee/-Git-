import UIKit

final class MovieQuizViewController: UIViewController {
    
    
    
    
    @IBOutlet private weak var textLabel: UILabel!
    
    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet weak var counterLabel: UILabel!
  
    
    private var currentQuestionIndex = 0
    private var correctAnswers = 0
    private let questionsAmount: Int = 10
    private var questionFactory: QuestionFactoryProtocol = QuestionFactory()
    private var currentQuestion: QuizQuestion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 20
        if let firstQuestion = self.questionFactory.requestNextQuestion() {
            self.currentQuestion = firstQuestion
            let viewModel = self.convert(model: firstQuestion)

            self.show(quiz: viewModel)
        }
    }
    
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let image = UIImage(named: model.image) ?? UIImage()
        let questionNumber = "\(currentQuestionIndex + 1)/\(questionsAmount)"
        return QuizStepViewModel (image: image, question: model.text, questionNumber: questionNumber)
    }
    private func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    private func showAnswerResult(isCorrect: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        imageView.layer.cornerRadius = 20
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showNextQuestionOrResults()
            
            self.imageView.layer.borderWidth = 0
        }
    }
    
    private func showNextQuestionOrResults() {
                
        if currentQuestionIndex == questionsAmount - 1 {
            if let nextQuestion = questionFactory.requestNextQuestion() {
                let viewModel = convert(model: nextQuestion)
                show(quiz: viewModel)
            }
        } else {
            let viewModel = QuizResultsViewModel (title: "Этот раунд окончен!" ,
                                               text: "Ваш результат: (correctAnswers)/\(questionsAmount)" ,
                                               buttonText: "Сыграть ещё раз")
            show(quiz: viewModel)
        }
    }
    
    
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        guard let currentQuestion = currentQuestion else {
            return
        }
            
            let givenAnswer = false
            
            showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
        }
        
    
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        guard let currentQuestion = currentQuestion else {
            return
        }
        let givenAnswer = true
        
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    
    private func show(quiz result: QuizResultsViewModel) {
        
        let alert = UIAlertController(
            title: result.title,
            message: result.text,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
            guard let self = self else {
                return
            }
            self.currentQuestionIndex = 0
            self.correctAnswers = 0
            
            if let firstQuestion = self.questionFactory.requestNextQuestion() {
                self.currentQuestion = firstQuestion
                
                let viewModel = self.convert(model: firstQuestion)
                self.show(quiz: viewModel)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            
            guard let self = self else { return }
            self.showNextQuestionOrResults()
        }
        
    }
}
