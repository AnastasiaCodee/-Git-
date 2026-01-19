import UIKit

final class MovieQuizViewController: UIViewController {
    
    private var currentQuestionIndex = 0
    
        @IBAction func yesButtonClicked(_ sender: UIButton) {
            
            let currentQuestion = questions [currentQuestionIndex]
            let givenAnswer = true
        }
    
    func showAnswerResult(isCorrect: givenAnswer == currentQuestion.correntAnswer)
    

@IBAction func noButtonClicked(_ sender: UIButton) {
    
    let currentQuestion = questions [currentQuestionIndex]
    let givenAnswer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
}


    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var counterLabel: UIStackView!
    
    struct QuizQuestion {
        let image: String
        let text: String
        let correctAnswer: Bool
    }

    
    private let questions : [QuizQuestion] = [
        
        
        //Mock-данные
        
        QuizQuestion(
            image : "The Godfather",
            //Картинка: The Godfather
            //Настоящий рейтинг: 9,2
            text: "Рейтинг этого фильма больше чем 6?" ,
            //Вопрос: Рейтинг этого фильма больше чем 6?
            correctAnswer: true),
        //Ответ: ДА
        
        QuizQuestion(
            image: "The Dark Knignt" ,
            // Картинка: The Dark Knight
            //Настоящий рейтинг: 9
            text: "Рейтинг этого фильма больше чем 6?",
            //Вопрос: Рейтинг этого фильма больше чем 6?
            correctAnswer: true),
        // Ответ: ДА
        
        QuizQuestion(
            image: "Kill Bill",
            //Картинка: Kill Bill
            //Настоящий рейтинг: 8,1
            text: "Рейтинг этого фильма больше чем 6?",
            // Вопрос: Рейтинг этого фильма больше чем 6?
            correctAnswer: true ),
        //Ответ: ДА
        
        QuizQuestion(
            image: "The Avengers",
            //Картинка: The Avengers
            //Настоящий рейтинг: 8
            text: "Рейтинг этого фильма больше чем 6?",
            //Вопрос: Рейтинг этого фильма больше чем 6?
            correctAnswer: true),
        //Ответ: ДА
        
        QuizQuestion(
            image: "Deadpool",
            //Картинка: Deadpool
            //Настоящий рейтинг: 8
            text: "Рейтинг этого фильма больше чем 6?",
            //Вопрос: Рейтинг этого фильма больше чем 6?
            correctAnswer: true),
        //Ответ: ДА
        
        QuizQuestion(
            image: "The Green Knigt",
            //Картинка: The Green Knight
            //Настоящий рейтинг: 6,6
            text: "Рейтинг этого фильма больше чем 6?",
            //Вопрос: Рейтинг этого фильма больше чем 6?
            correctAnswer: true),
        //Ответ: ДА
        
        
        QuizQuestion(
            image: "Old",
            //Картинка: Old
            //Настоящий рейтинг: 5,8
            text: "Рейтинг этого фильма больше чем 6?",
            //Вопрос: Рейтинг этого фильма больше чем 6?
            correctAnswer: false),
        //Ответ: НЕТ
        
        
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild" ,
            //Картинка: The Ice Age Adventures of Buck Wild
            //Настоящий рейтинг: 4,3
            text: "Рейтинг этого фильма больше чем 6?",
            //Вопрос: Рейтинг этого фильма больше чем 6?
            correctAnswer: false),
        //Ответ: НЕТ
        
        
        QuizQuestion(
            image: "Tesla",
            //Картинка: Tesla
            //Настоящий рейтинг: 5,1
            text: "Рейтинг этого фильма больше чем 6?",
            //Вопрос: Рейтинг этого фильма больше чем 6?
            correctAnswer: false),
        //Ответ: НЕТ
        
        
        QuizQuestion(
            image : "Vivarium",
            //Картинка: Vivarium
            //Настоящий рейтинг: 5,8
            text: "Рейтинг этого фильма больше чем 6?",
            //Вопрос: Рейтинг этого фильма больше чем 6?
            correctAnswer: false)
        //Ответ: НЕТ
    ]

struct QuizResultsViewModel{
    let title: String
    let text: String
    let buttonText: String
}

private func showAnswerResult(isCorrect: Bool) {
    imageView.layer.masksToBounds = true
    imageView.layer.borderWidth = 8
    imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    imageView.layer.cornerRadius = 20
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
        }
    }


struct QuizStepViewModel {
    let image: UIImage
    let question: String
    let questionNumber: String
}

let alert = UIAlertController(
    title: "Этот раунд окончен!",
    message: "Ваш результат ???",
    preferredStyle: .alert)

let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
    self.currentQuestionIndex = 0
    
    // заново показываем первый вопрос
    let firstQuestion = self.questions[self.currentQuestionIndex]
    let viewModel = self.convert(model: firstQuestion)
    self.show(quiz: viewModel)
}

alert.addAction(action)

self.present(alert, animated: true, completion: nil)
}

    

private var correntAnswer = 0

let firstQuestion = self.questions[self.currentQuestionIndex]
    let viewModel = self.convert(model: firstQuestion)
    self.show(quiz: viewModel)
}

alert.addAction(action)

self.present(alert, animated: true, completion: nil)
}
 
private func showAnswerResult(isCorrect: Bool) {
    if isCorrect { // 1
        correctAnswers += 1 // 2
    }
    
    imageView.layer.masksToBounds = true
    imageView.layer.borderWidth = 8
    imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { in
        self.showNextQuestionOrResults()
    }
}
private func show(quiz result: QuizResultsViewModel) {
    let alert = UIAlertController(
        title: result.title,
        message: result.text,
        preferredStyle: .alert)
    
    let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
        self.currentQuestionIndex = 0
        self.correctAnswers = 0
        
        let firstQuestion = self.questions[self.currentQuestionIndex]
        let viewModel = self.convert(model: firstQuestion)
        self.show(quiz: viewModel)
    }
    
    alert.addAction(action)
    
    self.present(alert, animated: true, completion: nil)
}
private func showNextQuestionOrResults() {
    if currentQuestionIndex == questions.count - 1 {
        let text = "Ваш результат: \(correctAnswers)/10" // 1
        let viewModel = QuizResultsViewModel( // 2
            title: "Этот раунд окончен!",
            text: text,
            buttonText: "Сыграть ещё раз")
        show(quiz: viewModel) // 3
    } else {
        currentQuestionIndex += 1
        let nextQuestion = questions[currentQuestionIndex]
        let viewModel = convert(model: nextQuestion)
        
        show(quiz: viewModel)
    }
}
