
import UIKit
import MSAL
import EmojiLog

class LoginInMSViewController: UIViewController, Loggable, URLSessionDelegate {
    @IBOutlet weak var resultTextView: UITextView!
    
    let kClientID = "15705daf-271b-4dcc-bda4-5d89cde1ce77"
    
    let kIssuer = "https://login.microsoftonline.com/brandwedir.onmicrosoft.com/v2.0"
    let kGraphURI = "https://graph.microsoft.com/v1.0/me/"
    let kScopes: [String] = ["https://graph.microsoft.com/user.read"]
    let kAuthority = "https://login.microsoftonline.com/common/oauth2/v2.0/authorize"
    
    var accessToken = String()
    var applicationContext = MSALPublicClientApplication()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login with Microsoft"
        
        do {
            self.applicationContext = try MSALPublicClientApplication(clientId: kClientID, authority: kAuthority)
        } catch {
            self.log.error("Unable to create Application Context")
        }
    }

    @IBAction func didTapOnLoginButton(_ sender: UIButton) {
        do {
            if  try self.applicationContext.users().isEmpty {
                throw NSError.init(domain: "MSALErrorDomain", code: MSALErrorCode.interactionRequired.rawValue, userInfo: nil)
            } else {
                try self.applicationContext.acquireTokenSilent(forScopes: self.kScopes, user: applicationContext.users().first) { (result, error) in
                    
                    if error == nil {
                        self.accessToken = (result?.accessToken)!
                        self.log.info("Refreshing token silently")
                        self.log.info("Refreshed Access token is \(self.accessToken)")
                        self.getContentWithToken()
                        
                    } else {
                        self.log.error("Could not acquire token silently: \(error ?? "No error informarion" as! Error)")
                        self.resultTextView.text = "Could not acquire token silently: \(error ?? "No error informarion" as! Error)"
                    }
                }
            }
        } catch let error as NSError {
            if error.code == MSALErrorCode.interactionRequired.rawValue {
                self.applicationContext.acquireToken(forScopes: self.kScopes) { (result, error) in
                    if error == nil {
                        self.accessToken = (result?.accessToken)!
                        self.log.info("Access token is \(self.accessToken)")
                        self.getContentWithToken()
                        
                    } else  {
                        self.log.error("Could not acquire token: \(error ?? "No error informarion" as! Error)")
                        self.resultTextView.text = "Could not acquire token: \(error ?? "No error informarion" as! Error)"
                    }
                }
            }
        }catch {
            self.log.error("Unable to acquire token. Got error: \(error)")
            self.resultTextView.text = "Unable to acquire token. Got error: \(error)"
        }
    }
    
    func getContentWithToken() {
        let sessionConfig = URLSessionConfiguration.default
        
        let url = URL(string: kGraphURI)
        var request = URLRequest(url: url!)
        
        request.setValue("Bearer \(self.accessToken)", forHTTPHeaderField: "Authorization")
        let urlSession = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: OperationQueue.main)
        
        urlSession.dataTask(with: request) { data, response, error in
            let result = try? JSONSerialization.jsonObject(with: data!, options: [])
            if result != nil {
                self.log.info(result.debugDescription)
                self.resultTextView.text = result.debugDescription
            }
        }.resume()
    }
    
    @IBAction func didTapOnLogOut(_ sender: UIButton) {
        do {
            try self.applicationContext.remove(self.applicationContext.users().first)
            self.resultTextView.text = "logout success"
        } catch let error {
            self.log.error("Received error signing user out: \(error)")
        }
    }
    
}

extension LoginInMSViewController: StoryboardViewController {
    static let storyboardName: String = "LoginInMS"
}
