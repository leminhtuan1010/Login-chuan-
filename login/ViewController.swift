//
//  ViewController.swift
//  login
//
//  Created by Minh Tuan on 5/9/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf_user: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    var taikhoan = ["tuan":"123","dat":"234","khoa":"345"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var count = 0

    @IBAction func acc_Dangnhap(_ sender: Any) {
        // Đăng nhập
        if let password = taikhoan[tf_user.text!]{
        if password == tf_password.text
        {
            lbl_indanhsach.text = "Đăng nhập thành công"
        }else{
            
            lbl_indanhsach.text = "Mật khẩu không đúng"
            }
            
        }else{
            
            lbl_indanhsach.text = "Tài khoản không tồn tại"
        }
    }
    // In ra danh sách
    @IBOutlet weak var lbl_indanhsach: UILabel!
    @IBAction func acc_danhsach(_ sender: UIButton) {
        var fullList = ""
        for (key,value) in taikhoan {
            fullList += "\(key):\(value)\n"
            
            lbl_indanhsach.text = "\(fullList)"

        }
    }
// Thêm/Đăng ký mới
    @IBAction func acc_them(_ sender: Any) {
        if let ktten = taikhoan[tf_user.text!]{
            lbl_indanhsach.text = String("Tài khoản đã tồn tại")
        }else if (tf_user.text == ""){
            lbl_indanhsach.text = String("Chưa nhập tên tài khoản")
        }else if (tf_password.text == ""){
            lbl_indanhsach.text = String("Chưa nhập mật khẩu")
        }else{
            taikhoan[tf_user.text!] = tf_password.text
            lbl_indanhsach.text = String("Đăng ký thành công")
        }

    }
    //sửa tài khoản gồm 2 bước : xác nhận đăng nhập thành công và cho phép sửa tài khoản
    @IBAction func acc_sua(_ sender: Any) {
        if (count == 0){
            if let password = taikhoan[tf_user.text!]{
                if password == tf_password.text
                {
                    lbl_indanhsach.text = " Nhập password mới  "
                    count = 1
                }else{
                    
                    lbl_indanhsach.text = "Mật khẩu không đúng"
                }
                
            }else{
                
                lbl_indanhsach.text = "Tài khoản không tồn tại"
            }

        }else if (count == 1){
           taikhoan[tf_user.text!] = tf_password.text
            lbl_indanhsach.text = String("Đã sửa mật khẩu")
            //count = 0
        }
    }
    // xoá tài khoản gồm 2 bước tương tự sửa
    @IBAction func acc_xoa(_ sender: Any) {
        if (count == 0){
            if let password = taikhoan[tf_user.text!]{
                if password == tf_password.text
                {
                    lbl_indanhsach.text = "Tài khoản tồn tại. Bán muốn có muốn xoá tài khoản ? "
                    count = 1
                }else{
                    
                    lbl_indanhsach.text = "Mật khẩu không đúng"
                }
                
            }else{
                
                lbl_indanhsach.text = "Tài khoản không tồn tại"
            }
            
        }else if (count == 1){
            let xoa = tf_user.text
            taikhoan.removeValue(forKey: xoa!)
            lbl_indanhsach.text = String("Đã Xoá")
        }
    }
}


