
import UIKit

protocol TimeZoneMVPView {
    var date1: Date? { get set }
    var date2: Date? { get set }
    var timeZone: TimeZone? { get set }
    
    func setDate1Label(_ date: Date)
    func setDate2Label(_ date: Date)
    
    func hideDateField()
    func hideDatePicker()
    func hideTimeZonePicker()
    func showDateField()
    func showDatePicker()
    func showTimeZonePicker()
    func showEqualsInmage()
    func showGreatThanInmage()
    func showLessThanInmage()
}

class TimeZoneMVPViewController: ViewControllerWithPresenter<TimeZoneMVPPresenter> {
    
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
        
        date1Label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnDate1Label)))
        date2Label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnDate2Label)))
    }
    
    @objc func didTapOnDate1Label() {
        presenter.didTapOnDate1Label()
    }
    
    @objc func didTapOnDate2Label() {
        presenter.didTapOnDate2Label()
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
        df.dateFormat = "dd/MM/yyyy hh:mm Z"
        
        return df
    }
    
    func setDate1Label(_ date: Date) {
        date1Label.text = dateFormatter.string(from: date)
    }
    
    func setDate2Label(_ date: Date) {
        date2Label.text = dateFormatter.string(from: date)
    }
    
    func hideDateField() {
        date1TextField.isHidden = true
    }
    
    func hideDatePicker() {
        date2Picker.isHidden = true
    }
    
    func hideTimeZonePicker() {
        timeZonePicker.isHidden = true
    }
    
    func showDateField() {
        date1TextField.isHidden = false
    }
    
    func showDatePicker() {
        date2Picker.isHidden = false
    }
    
    func showTimeZonePicker() {
        timeZonePicker.isHidden = false
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
