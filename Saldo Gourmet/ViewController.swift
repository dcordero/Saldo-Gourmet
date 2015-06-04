

import UIKit

class ViewController: UIViewController {

    let username = "[Your Card ID]"
    let password = "[Your Password]"
    
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchSaldo()
    }

    // MARK: Private
    
    private func fetchSaldo() {
        var post:NSString = "usuario=\(username)&contrasena=\(password)&token=ChequeGourmet1359"
        var url:NSURL = NSURL(string: "http://tarjetagourmet.chequegourmet.com/processLogin_new.jsp")!
        
        var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
        var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue(String(postData.length), forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        self.webview.loadRequest(request)
    }
}

