
class Adherent {

    // MARK: - Proprietes
    private(set) var nom: String
    private(set) var livresEmpruntes: [Livre] = []

    // MARK: - Constructeur
    init(nom: String) {
        self.nom = nom
    }

    // MARK: - Emprunter un livre
    func emprunterLivre(_ livre: Livre) {

        // Verifier la limite de 3 livres
        if livresEmpruntes.count >= 3 {
            print("Erreur : Vous ne pouvez pas emprunter plus de 3 livres.")
            return
        }

        // Emprunter le livre
        if livre.emprunter() {
            livresEmpruntes.append(livre)
            print("\(nom) a emprunte le livre avec succes.")
        }
    }

    // MARK: - Retourner un livre
    func retournerLivre(_ livre: Livre) {

        // Rechercher le livre dans la liste
        if let index = livresEmpruntes.firstIndex(where: {
            $0 === livre
        }) {

            livre.retourner()
            livresEmpruntes.remove(at: index)

            print("\(nom) a retourne le livre.")
        } else {
            print("Erreur : Ce livre n'est pas dans vos emprunts.")
        }
    }

    // MARK: - Afficher les emprunts
    func afficherEmprunts() {

        print("\n===== LIVRES EMPRUNTES =====")
        print("Adherent : \(nom)")

        if livresEmpruntes.isEmpty {
            print("Aucun livre emprunte.")
            return
        }

        for livre in livresEmpruntes {
            print("- \(livre.titre)")
        }

        print("Total : \(livresEmpruntes.count) livre(s)")
    }
}
