
import UIKit

protocol TimeZoneMVPView {
    
}

class TimeZoneMVPViewController: ViewControllerWithPresenter<TimeZoneMVPPresenter>, TimeZoneMVPView {
    
    @IBOutlet weak var date1Label: UILabel!
    @IBOutlet weak var date1TextField: UITextField!
    @IBOutlet weak var date2Label: UILabel!
    @IBOutlet weak var date2Picker: UIDatePicker!
    @IBOutlet weak var timeZonePicker: TimeZonePicker!
    @IBOutlet weak var resultImage: UIImageView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        presenter = TimeZoneMVPPresenterDefault()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        presenter = TimeZoneMVPPresenterDefault()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeZonePicker.pickerDelegate = presenter
    }
    
    @IBAction func didChangeDatePicker(_ sender: UIDatePicker) {
        presenter.didChangeDatePicker(date: sender.date)
    }
    
}

extension TimeZoneMVPViewController: StoryboardViewController {
    static var storyboardName: String {
        return "TimeZoneMVP"
    }
}
