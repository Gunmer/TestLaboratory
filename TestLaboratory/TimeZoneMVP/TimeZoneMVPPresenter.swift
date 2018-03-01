
import Foundation

protocol TimeZoneMVPPresenter: Presenter, TimeZonePickerDelegate {
    func didChangeDatePicker(date: Date)
}

class TimeZoneMVPPresenterDefault: PresenterBase<TimeZoneMVPView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date1 = Date()
        let date2 = Date()
        
        view.date1 = date1
        view.date2 = date2
        view.timeZone = Calendar.current.timeZone
        compare(date1: date1, date2: date2)
    }
    
    func compare(date1: Date, date2: Date) {
        let result = Calendar.current.compare(date1, to: date2, toGranularity: .minute)
        
        switch result {
        case .orderedAscending:
            view.showGreatThanInmage()
        case .orderedDescending:
            view.showLessThanInmage()
        case .orderedSame:
            view.showEqualsInmage()
        }
    }
    
}

extension TimeZoneMVPPresenterDefault: TimeZoneMVPPresenter {
    
    func didChangeDatePicker(date: Date) {
        guard let date1 = view.date1, let timeZone = view.timeZone else {
            return
        }
        
        var componets = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date)
        componets.timeZone = timeZone
        let date2 = Calendar.current.date(from: componets)!
        compare(date1: date1, date2: date2)
    }
    
    func didChangeTimeZonePicker(timeZone: TimeZone) {
        guard let date1 = view.date1, let date = view.date2 else {
            return
        }
        
        var componets = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date)
        componets.timeZone = timeZone
        let date2 = Calendar.current.date(from: componets)!
        compare(date1: date1, date2: date2)
    }
    
}
