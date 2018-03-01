
import UIKit

protocol TimeZoneMVPView {
    var date1: Date? { get set }
    var date2: Date? { get set }
    var timeZone: TimeZone? { get set }
    
    func showEqualsInmage()
    func showGreatThanInmage()
    func showLessThanInmage()
}

class TimeZoneMVPViewController: ViewControllerWithPresenter<TimeZoneMVPPresenter> {
    
    @IBOutlet weak var date1TextField: UITextField!
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

extension TimeZoneMVPViewController: TimeZoneMVPView {
    
    var date1: Date? {
        get {
            guard let text = date1TextField.text else {
                return nil
            }
            return dateFormatter.date(from: text)
        }
        
        set {
            guard let date = newValue else {
                date1TextField.text = nil
                return
            }
            date1TextField.text = dateFormatter.string(from: date)
        }
    }
    
    var date2: Date? {
        get {
            return date2Picker.date
        }
        
        set {
            if let date = newValue {
                date2Picker.setDate(date, animated: true)
            }
        }
    }
    
    var timeZone: TimeZone? {
        get {
            return timeZonePicker.timeZone
        }
        
        set {
            guard let timeZone = newValue else {
                return
            }
            
            timeZonePicker.setTimeZone(timeZone)
        }
    }
    
    private var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm Z"
        
        return df
    }
    
    func showEqualsInmage() {
        resultImage.image = UIImage(named: "Equals")
        resultImage.tintColor = .green
    }
    
    func showGreatThanInmage() {
        resultImage.image = UIImage(named: "UpArrow")
        resultImage.tintColor = .red
    }
    
    func showLessThanInmage() {
        resultImage.image = UIImage(named: "DownArrow")
        resultImage.tintColor = .red
    }
    
}
