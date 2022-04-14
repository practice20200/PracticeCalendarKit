
import UIKit

class ViewController: UIViewController {
    
    var data = [MyReminder]()
    
    lazy var tableView : UITableView = {
        let table = UITableView()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.register(ViewControllerTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        let addBTN = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHandler))
        navigationItem.rightBarButtonItem = addBTN
        
    }

    
    @objc func addHandler(){
        let vc = AddViewController()
        navigationController?.pushViewController(vc, animated: true)
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
