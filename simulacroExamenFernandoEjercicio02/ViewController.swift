//
//  ViewController.swift
//  simulacroExamenFernandoEjercicio02
//
//  Created by Eduardo Segovia Roman on 8/2/25.
//

import UIKit
import Toast

class ViewController: UIViewController {
    @IBOutlet weak var txtNumeroIntroducido: UITextField!
    @IBOutlet weak var lblResultado: UILabel!
    @IBOutlet weak var btnComprobar: UIButton!
    @IBOutlet weak var btnResume: UIButton!
    
    var numeroAleatorio: Int!;
    var cantidadOportunidades = 5;
    var intento: Int!
    var anteriorIntento: Int = -1;
    var esGanador: Bool!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numeroAleatorio = Int.random(in: 1...50);
    }
    
    @IBAction func btnComprobar(_ sender: Any) {
        if txtNumeroIntroducido.text != ""{
        if cantidadOportunidades > 0{
            intento = Int(txtNumeroIntroducido.text!)
            if intento == anteriorIntento{
                self.view.makeToast("¡El número no ha cambiado!")
            } else{
                anteriorIntento = intento
                if intento == numeroAleatorio{
                    btnResume.isHidden = false;
                    btnComprobar.isHidden = true;
                    lblResultado.text = "¡HAS ACERTADO!";
                    esGanador = true;
                } else if intento < numeroAleatorio{
                    lblResultado.text = "¡TU NÚMERO ES MÁS PEQUEÑO QUE EL BUSCADO!"
                    cantidadOportunidades -= 1;
                } else if intento > numeroAleatorio{
                    lblResultado.text = "¡TU NÚMERO ES MÁS GRANDE QUE EL BUSCADO!"
                    cantidadOportunidades -= 1;
                }
            }
                
            }else {
                btnResume.isHidden = false;
                btnComprobar.isHidden = true;
                lblResultado.text = "¡SE TE HAN ACABADO LOS INTENTOS!"
            }}else{
                self.view.makeToast("¡El campo no puede estar vacío!")
            }
    }
    
    @IBAction func btnResume(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "RESUME"{
            let destino = segue.destination as! SecondViewController
            if esGanador == true {
                destino.ganadorPerdedor = "GANADOR";
            } else {
                destino.ganadorPerdedor = "PERDEDOR";
            }
            destino.cantidadIntentos = 6 - cantidadOportunidades;
            destino.numeroGanador = numeroAleatorio;
        }
    }
    

}

