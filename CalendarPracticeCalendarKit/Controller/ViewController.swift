
import UIKit
import Elements
import UserNotifications

class ViewController: UIViewController {
    
    var data = [MyReminder]()
    
    
    lazy var tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = .blue
        table.widthAnchor.constraint(equalToConstant: 200).isActive = true
        table.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return table
    }()
    
    lazy var stack : VStack = {
        let stack = VStack()
        stack.addArrangedSubview(tableView)
        
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reminder"
        view.backgroundColor = .white
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        tableView.register(ViewControllerTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        let addBTN = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHandler))
        navigationItem.rightBarButtonItem = addBTN
        
        let testBTN = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .done, target: self, action: #selector(testHandler))
        navigationItem.leftBarButtonItem = testBTN
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.bounds = view.frame
    }

    
    @objc func addHandler(){
        let vc = AddViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func testHandler(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] success, error in
            if success{
                self?.scheduleTest()
                
            }else if let error = error{
                print("Error: \(error.localizedDescription)")
                
            }
        }
    }

    func scheduleTest(){
        let content = UNMutableNotificationContent()
        content.title = "Test"
        content.sound = .default
        content.body = "Test Description"
        
        let targetDate = Date().addingTimeInterval(5)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
        let request = UNNotificationRequest (identifier: "query", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if error != nil {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }

}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        let item = data[indexPath.row]
        return cell
    }
    
    
}
