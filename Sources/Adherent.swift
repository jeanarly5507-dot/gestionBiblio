
class Adherent {
    private(set) var nom: String
    private(set) var livresEmpruntes: [Livre] = []
    init(nom: String) {
        self.nom = nom
    }

    func emprunterLivre(_ livre: Livre) {
        if livresEmpruntes.count >= 3 {
            print("Erreur : Vous ne pouvez pas emprunter plus de 3 livres.")
            return
        }
        if livre.emprunter() {
            livresEmpruntes.append(livre)
            print("\(nom) a emprunte le livre avec succes.")
        }
    }

    func retournerLivre(_ livre: Livre) {
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
