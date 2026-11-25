
class Livre {
    // Propriétés
    private(set) var titre: String
    private(set) var auteur: String
    private(set) var estDisponible: Bool
    init(titre: String, auteur: String) {
        self.titre = titre
        self.auteur = auteur
        self.estDisponible = true
    }
    // Afficher les informations
    func afficherInformations() {
        print("Titre : \(titre)")
        print("Auteur : \(auteur)")
        print("Disponible : \(estDisponible ? "Oui" : "Non")")
    }

    // Emprunter un livre
    func emprunter() -> Bool {
        if estDisponible {
            estDisponible = false
            print("Le livre '\(titre)' a été emprunté.")
            return true
        }

        print("Ce livre n'est pas disponible.")
        return false
    }
    // Retourner un livre
    func retourner() -> Bool {
        if !estDisponible {
            estDisponible = true
            print("Le livre '\(titre)' a été retourné.")
            return true
        }
        print("Ce livre est déjà disponible.")
        return false
    }
}
