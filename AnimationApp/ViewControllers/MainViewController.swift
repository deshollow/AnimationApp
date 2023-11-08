//
//  MainViewController.swift
//  AnimationApp
//
//  Created by deshollow on 08.11.2023.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {
    
    @IBOutlet weak var presentView: SpringView!
    
    @IBOutlet weak var presetNameLabel: SpringLabel!
    @IBOutlet weak var curveNameLabel: SpringLabel!
    @IBOutlet weak var forceNameLabel: SpringLabel!
    @IBOutlet weak var durationNameLabel: SpringLabel!
    @IBOutlet weak var delayNameLabel: SpringLabel!
    
    @IBOutlet weak var presetValueLabel: SpringLabel!
    @IBOutlet weak var curveValueLabel: SpringLabel!
    @IBOutlet weak var forceValueLabel: SpringLabel!
    @IBOutlet weak var durationValueLabel: SpringLabel!
    @IBOutlet weak var delayValueLabel: SpringLabel!
    
    @IBOutlet weak var runButton: SpringButton!
    
    private let defaultAnimationValues = Animation.getDefaultValues()
    private var animation = Animation.getAnimations()
    
    private var nameLabels: [SpringLabel] = []
    private var valueLabels: [SpringLabel] = []
    
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabels = [
            presetNameLabel,
            curveNameLabel,
            forceNameLabel,
            durationNameLabel,delayNameLabel
        ]
        valueLabels = [presetValueLabel,
                       curveValueLabel,
                       forceValueLabel,
                       durationValueLabel,delayValueLabel
        ]
        startConditionView()
    }
    
    @IBAction func runButtonPressed() {
        switch counter {
        case 0:
            changeLabel()
            presentViewAnimating()
            labelAnimating()
            changeButton(counter + 1)
            counter += 1
        case 1:
            changeLabel()
            presentViewAnimating()
            labelAnimating()
            changeButton(counter + 1)
            counter += 1
        case 2:
            changeLabel()
            presentViewAnimating()
            labelAnimating()
            changeButton(counter + 1)
            counter += 1
        case 3:
            changeLabel()
            presentViewAnimating()
            labelAnimating()
            changeButton(counter + 1)
            counter += 1
        default:
            changeLabel()
            presentViewAnimating()
            labelAnimating()
            animation.shuffle()
            counter = 0
            changeButton(counter)
            
        }
    }
    
    private func startConditionView() {
        
        presetValueLabel.text = defaultAnimationValues.preset
        curveValueLabel.text = defaultAnimationValues.curve
        forceValueLabel.text = String(defaultAnimationValues.force)
        durationValueLabel.text = String(defaultAnimationValues.duration)
        delayValueLabel.text = String(defaultAnimationValues.delay)
    }
    
    private func changeLabel() {
        presetValueLabel.text = animation[counter].preset
        curveValueLabel.text = animation[counter].curve
        forceValueLabel.text = String(animation[counter].force)
        durationValueLabel.text = String(animation[counter].duration)
        delayValueLabel.text = String( animation[counter].delay)

    }
    
    
    private func changeButton(_ number: Int) {
        runButton.setTitle(animation[number].preset, for: .normal)
    }
    
    private func presentViewAnimating() {
        presentView.animation = animation[counter].preset
        presentView.curve = animation[counter].curve
        presentView.force = animation[counter].force
        presentView.duration = animation[counter].duration
        presentView.delay = animation[counter].delay
        
        presentView.animate()
    }
    
    private func labelAnimating() {
        
        for label in nameLabels {
            label.animation = animation[counter].preset
            label.curve = animation[counter].curve
            label.force = animation[counter].force
            label.duration = animation[counter].duration
            label.delay = animation[counter].delay
            
            label.animate()
        }
        
        for label in valueLabels {
            label.animation = animation[counter].preset
            label.curve = animation[counter].curve
            label.force = animation[counter].force
            label.duration = animation[counter].duration
            label.delay = animation[counter].delay
            
            label.animate()
        }
        
    }
    
}

//сделал так, чтобы вначале было последовательное превью всех доступных вариаций анимации, а уж потом рандомно
//было мало времени на реализацию, старался успеть, общался с товарищем.
//понимаю что можно больщую часть как-то облегчить, но не успел(
