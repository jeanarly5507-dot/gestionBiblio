
class Bibliotheque {

    private(set) var livres: [Livre] = []
    private(set) var adherents: [Adherent] = []

    func ajouterLivre(_ livre: Livre) {
        livres.append(livre)
        print("Livre ajoute avec succes !")
    }

    func afficherCatalogue() {
        print("\n========== CATALOGUE ==========")

        if livres.isEmpty {
            print("Aucun livre enregistre.")
            return
        }

        for (index, livre) in livres.enumerated() {
            print("\nLivre numero \(index + 1)")
            livre.afficherInformations()
            print("----------------------")
        }
    }

    func rechercherLivre(titre: String) -> Livre? {
        return livres.first {
            $0.titre.localizedCaseInsensitiveCompare(titre) == .orderedSame
        }
    }

    func ajouterAdherent(_ adherent: Adherent) {
        if rechercherAdherent(nom: adherent.nom) != nil {
            print("Cet adherent existe deja.")
            return
        }

        adherents.append(adherent)
        print("Adherent enregistre avec succes !")
    }

    func rechercherAdherent(nom: String) -> Adherent? {
        return adherents.first {
            $0.nom.localizedCaseInsensitiveCompare(nom) == .orderedSame
        }
    }

    func afficherAdherents() {
        print("\n========== LISTE DES ADHERENTS ==========")

        if adherents.isEmpty {
            print("Aucun adherent enregistre.")
            return
        }

        for (index, adherent) in adherents.enumerated() {
            print("\(index + 1). \(adherent.nom)")
        }
    }
}
