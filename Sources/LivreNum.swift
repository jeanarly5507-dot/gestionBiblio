
class LivreNumerique: Livre {

    // Proprietes supplementaires
    private(set) var tailleFichierMo: Double

    // Constructeur
    init(titre: String, auteur: String, tailleFichierMo: Double) {

        self.tailleFichierMo = tailleFichierMo

        super.init(titre: titre, auteur: auteur)
    }

    // Redefinition de la methode
    override func afficherInformations() {

        print("Type : Livre numerique")
        print("Titre : \(titre)")
        print("Auteur : \(auteur)")
        print("Taille du fichier : \(tailleFichierMo) Mo")
        print("Disponible : \(estDisponible ? "Oui" : "Non")")
    }
}
