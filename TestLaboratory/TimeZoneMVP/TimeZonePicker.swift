
import UIKit

protocol TimeZonePickerDelegate: class {
    func didChangeTimeZonePicker(timeZone: TimeZone)
}

class TimeZonePicker: UIPickerView {
    
    var timeZones = [TimeZone]()
    var timeZone: TimeZone?
    weak var pickerDelegate: TimeZonePickerDelegate?
    
    override func awakeFromNib() {
        for hour in -18...18 {
            if let timeZone = TimeZone(secondsFromGMT: 3600 * hour ) {
                timeZones.append(timeZone)
            }
        }
        
        delegate = self
        dataSource = self
    }
    
}

extension TimeZonePicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeZones.count
    }
    
}

extension TimeZonePicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timeZones[row].abbreviation()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        timeZone = timeZones[row]
        pickerDelegate?.didChangeTimeZonePicker(timeZone: timeZone!)
    }
}
