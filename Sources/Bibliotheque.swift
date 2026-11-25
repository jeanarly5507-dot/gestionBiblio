
class Bibliotheque {

    // MARK: - Proprietes
    private(set) var livres: [Livre] = []

    // MARK: - Ajouter un livre
    func ajouterLivre(_ livre: Livre) {

        livres.append(livre)

        print("Livre '\(livre.titre)' ajoute avec succes.")
    }

    // MARK: - Afficher le catalogue
    func afficherCatalogue() {

        print("\n========== CATALOGUE ==========")

        if livres.isEmpty {
            print("La bibliotheque ne contient aucun livre.")
            return
        }

        for (index, livre) in livres.enumerated() {

            print("\nLivre numero \(index + 1)")
            livre.afficherInformations()
            print("--------------------------")
        }
    }

    // MARK: - Rechercher un livre
    func rechercherLivre(titre: String) -> Livre? {

        let resultat = livres.first {
            $0.titre.localizedCaseInsensitiveCompare(titre) == .orderedSame
        }

        if resultat != nil {
            print("Livre trouve : \(titre)")
        } else {
            print("Livre introuvable : \(titre)")
        }

        return resultat
    }
}
