import UIKit
import RxSwift

private func alertController(message: String, title: String) -> UIAlertController {
    let alertController =  UIAlertController(title: title, message: message, preferredStyle: .Alert)

    alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))

    return alertController
}

extension UIView {
    typealias PresentAlertClosure = (alertController: UIAlertController) -> Void

    func presentOnLongPress(message: String, title: String, closure: PresentAlertClosure) {
        let recognizer = UILongPressGestureRecognizer()

        recognizer.rac_gestureSignal().subscribeNext { _ -> Void in
            closure(alertController: alertController(message, title: title))
        }

        userInteractionEnabled = true
        addGestureRecognizer(recognizer)
    }
}
