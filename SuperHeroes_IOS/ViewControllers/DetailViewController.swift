//
//  DetailViewController.swift
//  SuperHeroes_IOS
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblDetailName: UILabel!
    @IBOutlet weak var DetailImageView: UIImageView!
    
    @IBOutlet weak var OpcionesTab: UISegmentedControl!
    
    @IBOutlet weak var BiografiaView: UIView!
    @IBOutlet weak var PowerStatView: UIView!
    @IBOutlet weak var ConnectionsView: UIView!
    @IBOutlet weak var WorkView: UIView!
    @IBOutlet weak var AppearanceView: UIView!
    
 // BiografiaView
    @IBOutlet weak var RealNameText: UITextView!
    @IBOutlet weak var AligmentText: UITextView!
    @IBOutlet weak var PublisherText: UITextView!
    @IBOutlet weak var PlaceBirthText: UITextView!
    @IBOutlet weak var FirstAppeText: UITextView!
// PowerStatView
    @IBOutlet weak var InteligenciaStat: UIProgressView!
    @IBOutlet weak var FuerzaStat: UIProgressView!
    @IBOutlet weak var VelocidadStat: UIProgressView!
    @IBOutlet weak var ResistenciaStat: UIProgressView!
    @IBOutlet weak var PoderesStat: UIProgressView!
    @IBOutlet weak var CombateStat: UIProgressView!
    
    @IBOutlet weak var lblInteligencia: UILabel!
    @IBOutlet weak var lblFuerza: UILabel!
    @IBOutlet weak var lblVelocidad: UILabel!
    @IBOutlet weak var lblResistencia: UILabel!
    @IBOutlet weak var lblPoderes: UILabel!
    @IBOutlet weak var lblCombate: UILabel!
// ConnectionsView
    @IBOutlet weak var AfiliacionText: UITextView!
    @IBOutlet weak var RelativosText: UITextView!
    
// WorkView

    @IBOutlet weak var OcupacionText: UITextView!
    @IBOutlet weak var CentroTrabajoText: UITextView!
    
// AppearanceView
    @IBOutlet weak var GeneroText: UITextView!
    @IBOutlet weak var RazaText: UITextView!
    @IBOutlet weak var Altura1Text: UITextView!
    @IBOutlet weak var Altura2Text: UITextView!
    @IBOutlet weak var Peso1Text: UITextView!
    @IBOutlet weak var Peso2Text: UITextView!
    @IBOutlet weak var ColorOjosText: UITextView!
    @IBOutlet weak var ColorPeloText: UITextView!
    
    var superhero: SuperheroClass!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TabSelected(index: 0)

        navigationItem.title = superhero.name
        lblDetailName.text = superhero.name
        DetailImageView.loadFrom(url: superhero.image.url)
        
        LoadSuperHeroe()
    }
    
//  Manejo de la botonera: Ayer - hoy - mañana ----------------------------------------------------------------------

    @IBAction func OpcionesTab(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        TabSelected(index: selectedIndex)
    }
    
 // selección del Tab
    
    func TabSelected(index:Int){
        BiografiaView.isHidden = index != 0
        PowerStatView.isHidden = index != 1
        AppearanceView.isHidden = index != 2
        ConnectionsView.isHidden = index != 4
        WorkView.isHidden = index != 3
    }
    
// Carga de datos del SuperHeroe  -----------------------------------------------------------------------------------
    
    func LoadSuperHeroe(){
        
     // Biografia
        RealNameText.text = superhero.name
        PublisherText.text = superhero.biography.publisher
        AligmentText.text = superhero.biography.alignment
        PlaceBirthText.text = superhero.biography.placeOfBirth
        FirstAppeText.text = superhero.biography.firstAppearance
        
     // Estadisticas
        lblInteligencia.text = superhero.powerstats.intelligence
        lblFuerza.text = superhero.powerstats.strength
        lblResistencia.text = superhero.powerstats.durability
        lblVelocidad.text = superhero.powerstats.speed
        lblCombate.text = superhero.powerstats.combat
        lblPoderes.text = superhero.powerstats.power
         
        InteligenciaStat.progress = Float(Double(superhero.powerstats.intelligence)! / 100)
        FuerzaStat.progress = Float(Double(superhero.powerstats.strength)! / 100)
        ResistenciaStat.progress = Float(Double(superhero.powerstats.durability)! / 100)
        VelocidadStat.progress = Float(Double(superhero.powerstats.speed)! / 100)
        CombateStat.progress = Float(Double(superhero.powerstats.combat)! / 100)
        
     // Apariencia
        GeneroText.text = superhero.appearance.gender
        RazaText.text = superhero.appearance.race
  //      AlturaText.text = superhero.appearance.height
  //      PesoText.text = superhero.appearance.weight
        ColorOjosText.text = superhero.appearance.eyeColor
        ColorPeloText.text = superhero.appearance.hairColor
        
    // Work
        OcupacionText.text = superhero.work.occupation
        CentroTrabajoText.text = superhero.work.base
        
   // Connexiones
        AfiliacionText.text = superhero.connections.groupAffiliation
        RelativosText.text = superhero.connections.relatives
    }
}
    
