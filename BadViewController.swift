import UIKit

class BadViewController: UIViewController {
    private let apiKey = "abc123"

    private var textView: UILabel?
    private var btnClick: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        textView = UILabel()
        textView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView!)
        textView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        btnClick = UIButton(type: .system)
        btnClick?.translatesAutoresizingMaskIntoConstraints = false
        btnClick?.setTitle("Click", for: .normal)
        view.addSubview(btnClick!)
        btnClick?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnClick?.topAnchor.constraint(equalTo: textView!.bottomAnchor, constant: 16).isActive = true
        btnClick?.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
    }

    @objc private func onClick(_ sender: UIButton) {
        let message = getMessage()
        textView?.text = message
        
        sendRequest(apiKey: apiKey)
    }

    private func getMessage() -> String {
        var message = "Hello, "
        message += getName()
        return message
    }

    private func getName() -> String {
        guard let textField = view.viewWithTag(1) as? UITextField else { return "" }
        return textField.text ?? ""
    }

    private func sendRequest(apiKey: String) {
        let url = URL(string: "http://api.example.com/data")!
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Handle the response
        }
        task.resume()
    }
}