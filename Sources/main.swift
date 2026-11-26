
import Foundation

let bibliotheque = Bibliotheque()

// Fonction de saisie du texte
func lireTexte(_ message: String) -> String {
    print(message, terminator: "")
    return readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
}

// Fonction de saisie d'un entier
func lireEntier(_ message: String) -> Int {
    while true {
        let valeur = lireTexte(message)

        if let nombre = Int(valeur) {
            return nombre
        }

        print("Veuillez entrer un nombre valide.")
    }
}

// Fonction de saisie d'un nombre decimal
func lireDecimal(_ message: String) -> Double {
    while true {
        let valeur = lireTexte(message)
            .replacingOccurrences(of: ",", with: ".")

        if let nombre = Double(valeur), nombre > 0 {
            return nombre
        }

        print("Veuillez entrer un nombre valide.")
    }
}

// Enregistrer un livre
func enregistrerLivre() {
    print("\n===== ENREGISTRER UN LIVRE =====")

    let titre = lireTexte("Titre : ")
    let auteur = lireTexte("Auteur : ")

    if titre.isEmpty || auteur.isEmpty {
        print("Le titre et l'auteur sont obligatoires.")
        return
    }

    print("1. Livre papier")
    print("2. Livre numerique")

    let choix = lireEntier("Type de livre : ")

    switch choix {
    case 1:
        let pages = lireEntier("Nombre de pages : ")

        if pages <= 0 {
            print("Nombre de pages invalide.")
            return
        }

        let livre = LivrePapier(
            titre: titre,
            auteur: auteur,
            nombrePages: pages
        )

        bibliotheque.ajouterLivre(livre)

    case 2:
        let taille = lireDecimal("Taille du fichier en Mo : ")

        let livre = LivreNumerique(
            titre: titre,
            auteur: auteur,
            tailleFichierMo: taille
        )

        bibliotheque.ajouterLivre(livre)

    default:
        print("Type de livre invalide.")
    }
}

// Rechercher un livre
func rechercherUnLivre() {
    print("\n===== RECHERCHER UN LIVRE =====")

    let titre = lireTexte("Entrez le titre : ")

    if let livre = bibliotheque.rechercherLivre(titre: titre) {
        print("Livre trouve :")
        livre.afficherInformations()
    } else {
        print("Livre introuvable.")
    }
}

// Enregistrer un adherent
func enregistrerAdherent() {
    print("\n===== ENREGISTRER UN ADHERENT =====")

    let nom = lireTexte("Nom de l'adherent : ")

    if nom.isEmpty {
        print("Le nom est obligatoire.")
        return
    }

    let adherent = Adherent(nom: nom)
    bibliotheque.ajouterAdherent(adherent)
}

// Emprunter un livre
func emprunterUnLivre() {
    print("\n===== EMPRUNTER UN LIVRE =====")

    let nom = lireTexte("Nom de l'adherent : ")

    guard let adherent = bibliotheque.rechercherAdherent(nom: nom) else {
        print("Adherent introuvable.")
        return
    }

    let titre = lireTexte("Titre du livre : ")

    guard let livre = bibliotheque.rechercherLivre(titre: titre) else {
        print("Livre introuvable.")
        return
    }

    adherent.emprunterLivre(livre)
}

// Retourner un livre
func retournerUnLivre() {
    print("\n===== RETOURNER UN LIVRE =====")

    let nom = lireTexte("Nom de l'adherent : ")

    guard let adherent = bibliotheque.rechercherAdherent(nom: nom) else {
        print("Adherent introuvable.")
        return
    }

    let titre = lireTexte("Titre du livre : ")

    guard let livre = bibliotheque.rechercherLivre(titre: titre) else {
        print("Livre introuvable.")
        return
    }

    adherent.retournerLivre(livre)
}

// Afficher les emprunts
func afficherEmprunts() {
    print("\n===== AFFICHER LES EMPRUNTS =====")

    let nom = lireTexte("Nom de l'adherent : ")

    guard let adherent = bibliotheque.rechercherAdherent(nom: nom) else {
        print("Adherent introuvable.")
        return
    }

    adherent.afficherEmprunts()
}

// Menu principal
var continuer = true

while continuer {

    print("\n")
    print("========================================")
    print("          BIBLIOTHEQUE CHCL")
    print("          SYSTEME DE GESTION")
    print("========================================")
    print("1. Enregistrer un livre")
    print("2. Afficher le catalogue")
    print("3. Rechercher un livre")
    print("4. Enregistrer un adherent")
    print("5. Afficher les adherents")
    print("6. Emprunter un livre")
    print("7. Retourner un livre")
    print("8. Afficher les emprunts")
    print("9. Quitter")
    print("========================================")

    let choix = lireEntier("Choisissez une option : ")

    switch choix {

    case 1:
        enregistrerLivre()

    case 2:
        bibliotheque.afficherCatalogue()

    case 3:
        rechercherUnLivre()

    case 4:
        enregistrerAdherent()

    case 5:
        bibliotheque.afficherAdherents()

    case 6:
        emprunterUnLivre()

    case 7:
        retournerUnLivre()

    case 8:
        afficherEmprunts()

    case 9:
        continuer = false
        print("Merci d'avoir utilise la Bibliotheque CHCL !")

    default:
        print("Option invalide. Veuillez recommencer.")
    }
}
