import UIKit

class AddPlayersViewController: UIViewController {
    
    let titleLabel = UILabel(textLabel: "Кто играет?", font: .noteworthy50())
    var playersTableView = UITableView()
    let addPlayersTextField = UITextField()
    let addPlayersButton = UIButton(type: .system)
    let continueButton = UIButton(title: "Начать игру!", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    
    var presenter: AddPlayersPresenterProtocol?
    
    var lol = ["11","11","11","11","11",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)
        customTableView()
        customTextField()
        customAddPlayerButton()
        customContinueButton()
        layoutDesign()
    }
    
    private func customTableView() {
        playersTableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        playersTableView.delegate = self
        playersTableView.dataSource = self
        playersTableView.backgroundColor = .clear
    }
    private func customAddPlayerButton() {
        addPlayersButton.isHidden  = true
        addPlayersButton.setImage(UIImage(named: "WhitePlusAction"), for: .normal)
        addPlayersButton.addTarget(self, action: #selector(addPlayersButtonTapped), for: .touchUpInside)
    }
    private func customTextField() {
        addPlayersTextField.font = .noteworthy24()
        addPlayersTextField.placeholder = "Имя игрока..."
        addPlayersTextField.layer.masksToBounds = true
        addPlayersTextField.clipsToBounds = false
        addPlayersTextField.backgroundColor = .white
        addPlayersTextField.layer.cornerRadius = 5
        addPlayersTextField.addTarget(self, action: #selector(addPlayersInTextField), for: .editingChanged)
    }
    private func customContinueButton() {
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    private func layoutDesign() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addPlayersButton.translatesAutoresizingMaskIntoConstraints = false
        addPlayersTextField.translatesAutoresizingMaskIntoConstraints = false
        playersTableView.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playersTableView)
        view.addSubview(continueButton)
        view.addSubview(titleLabel)
        view.addSubview(addPlayersButton)
        view.addSubview(addPlayersTextField)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            addPlayersTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addPlayersTextField.trailingAnchor.constraint(equalTo: addPlayersButton.leadingAnchor, constant: -10),
            addPlayersTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            addPlayersTextField.heightAnchor.constraint(equalToConstant: 50),
            addPlayersButton.centerYAnchor.constraint(equalTo: addPlayersTextField.centerYAnchor),
            addPlayersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addPlayersButton.widthAnchor.constraint(equalToConstant: 50),
            addPlayersButton.heightAnchor.constraint(equalToConstant: 50),
            playersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            playersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            playersTableView.topAnchor.constraint(equalTo: addPlayersTextField.bottomAnchor, constant: 20),
            playersTableView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -20),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            continueButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc private func addPlayersButtonTapped() {
        if addPlayersTextField.text != nil {
            presenter?.addNewPlayer(player: addPlayersTextField.text!)
        }
    }
    @objc private func continueButtonTapped() {
        presenter?.startGame()
    }
    
    
    @objc private func addPlayersInTextField() {
        if addPlayersTextField.text != "" {
            addPlayersButton.isHidden = false
        } else {
            addPlayersButton.isHidden = true
        }
    }
    
    private func leadingSwipeCell(indexPath: IndexPath, tableView: UITableView) {
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.fillMode = CAMediaTimingFillMode.removed
        transition.duration = 0.5
        transition.subtype = CATransitionSubtype.fromLeft
        tableView.layer.add(transition, forKey: "UITableViewReloadDataAnimationKey")
        tableView.reloadData()
    }
    
    private func trailingSwipeCell(indexPath: IndexPath, tableView: UITableView) {
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.fillMode = CAMediaTimingFillMode.removed
        transition.duration = 0.5
        transition.subtype = CATransitionSubtype.fromLeft
        tableView.layer.add(transition, forKey: "UITableViewReloadDataAnimationKey")
        tableView.reloadData()
    }
    
    
}

// MARK: - UITableViewDelegate UITableViewDataSource
extension AddPlayersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.gameSettings.players.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        let player = presenter?.gameSettings.players[indexPath.row]
        cell.number.text = String(indexPath.row + 1) + ":"
        cell.name.text = player
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Удалить") { [weak self] (action, view, completionHandler) in
            self?.presenter?.deletePlayer(index: indexPath.row)
            self?.leadingSwipeCell(indexPath: indexPath, tableView: tableView)
            completionHandler(true)
        }
        action.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Удалить") { [weak self] (action, view, completionHandler) in
            self?.presenter?.deletePlayer(index: indexPath.row)
            self?.trailingSwipeCell(indexPath: indexPath, tableView: tableView)
            completionHandler(true)
        }
        action.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [action])
    }
}



extension AddPlayersViewController: AddPlayersViewProtocol {
    
    func deletePlayer(index: Int) {
        
    }
    
    func newPlayerAdded() {
        addPlayersTextField.text = nil
        addPlayersButton.isHidden = true
        playersTableView.reloadData()
    }
    
    func updateUI() {
        
    }
}
