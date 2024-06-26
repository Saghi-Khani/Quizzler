import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    
    var quizBrain = QuizBrain()
    var counter = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quizBrain.quiz[quizBrain.questionNumber + 1].text
        scoreLabel.text = "Score: 0"
        UpdateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) 
    {
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        
        if(userGotItRight){
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(UpdateUI), userInfo: nil, repeats: false)
    }
    
    @objc func UpdateUI()
    {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
       
        let allAnswers = quizBrain.getAllAnswers()
        let buttons = [choice1Button, choice2Button, choice3Button]
               
        for (index, answer) in allAnswers.enumerated() {
            buttons[index]?.setTitle(answer, for: .normal)
        }
        
        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
    }
}



