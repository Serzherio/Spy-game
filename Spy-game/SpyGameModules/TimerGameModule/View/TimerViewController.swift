//
//  TimerViewController.swift
//  Spy-game
//
//  Created by Сергей on 05.04.2022.
//

import UIKit

class TimerViewController: UIViewController {
    
    // UIElements
    let startTimerTitle = UILabel(textLabel: "Время пошло!", font: .noteworthy50())
    let subtitleTimer = UILabel(textLabel: "Когда таймер дойдет до 0:00, шпион совершит диверсию!", font: .noteworthy24())
    let timerLabel = UILabel(textLabel: "00:00", font: .noteworthy50())
    let timerLogo = UIImageView(image: UIImage(named: "Timer"))
    let timerDescriptionLabel = UILabel(textLabel: "Таймер можно остановить, если большинство игроков согласны с этим решением.", font: .noteworthy24())
    let stopTimerButton = UIButton(title: "Остановить!", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    
    var presenter: TimerPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)
        setupUIElements()
        layoutDesign()
    }
    
    private func setupUIElements() {
        startTimerTitle.numberOfLines = 0
        startTimerTitle.textAlignment = .center
        subtitleTimer.numberOfLines = 0
        subtitleTimer.textAlignment = .center
        timerDescriptionLabel.numberOfLines = 0
        timerDescriptionLabel.textAlignment = .center
        timerLabel.numberOfLines = 0
        timerLabel.textAlignment = .center
        timerLogo.contentMode = .scaleAspectFit
        stopTimerButton.addTarget(self, action: #selector(stopTimerButtonTapped), for: .touchUpInside)
    }
    
    private func layoutDesign() {
        startTimerTitle.translatesAutoresizingMaskIntoConstraints = false
        subtitleTimer.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLogo.translatesAutoresizingMaskIntoConstraints = false
        timerDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        stopTimerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startTimerTitle)
        view.addSubview(subtitleTimer)
        view.addSubview(timerLabel)
        view.addSubview(timerLogo)
        view.addSubview(timerDescriptionLabel)
        view.addSubview(stopTimerButton)
        
        NSLayoutConstraint.activate([
            startTimerTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startTimerTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            startTimerTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.8),
            subtitleTimer.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            subtitleTimer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleTimer.topAnchor.constraint(equalTo: startTimerTitle.bottomAnchor, constant: 20),
            timerLabel.bottomAnchor.constraint(equalTo: timerLogo.topAnchor, constant: -20),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timerLogo.widthAnchor.constraint(equalToConstant: 150),
            timerLogo.heightAnchor.constraint(equalToConstant: 150),
            timerDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerDescriptionLabel.bottomAnchor.constraint(equalTo: stopTimerButton.topAnchor, constant: -30),
            timerDescriptionLabel.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            stopTimerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stopTimerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stopTimerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            stopTimerButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupTimerView(secondToEnd: Int) {
        let minutes = String(format: "%02d", secondToEnd / 60)
        let seconds = String(format: "%02d", secondToEnd % 60)
        timerLabel.text = minutes + ":" + seconds
    }
    
    @objc private func stopTimerButtonTapped() {
        presenter?.stopTimer()
    }
    
    
}

extension TimerViewController: TimerViewProcotol {
    
    func setLeftTime(secondsToEnd: Int) {
        setupTimerView(secondToEnd: secondsToEnd)
    }
    
    
    func tickTimer(secondsToEnd: Int) {
        setupTimerView(secondToEnd: secondsToEnd)
    }
    
    
}
