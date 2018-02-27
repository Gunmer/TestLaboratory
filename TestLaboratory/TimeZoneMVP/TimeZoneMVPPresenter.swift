
import Foundation

protocol TimeZoneMVPPresenter: Presenter, TimeZonePickerDelegate {
    func didChangeDatePicker(date: Date)
}

class TimeZoneMVPPresenterDefault: PresenterBase<TimeZoneMVPView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.setDate1
    }
    
}

extension TimeZoneMVPPresenterDefault: TimeZoneMVPPresenter {
    
    func didChangeDatePicker(date: Date) {
        
    }
    
    func didChangeTimeZonePicker(timeZone: TimeZone) {
        
    }
    
}
