
class LivrePapier: Livre {
    // Proprietes supplementaires
    private(set) var nombrePages: Int
    // Constructeur
    init(titre: String, auteur: String, nombrePages: Int) {
        self.nombrePages = nombrePages
        super.init(titre: titre, auteur: auteur)
    }

     // Redefinition de la methode
    override func afficherInformations() {
        print("Type : Livre papier")
        print("Titre : \(titre)")
        print("Auteur : \(auteur)")
        print("Nombre de pages : \(nombrePages)")
        print("Disponible : \(estDisponible ? "Oui" : "Non")")
    }
}
