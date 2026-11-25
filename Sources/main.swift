
import Foundation

// =====================================
// 1. CREATION DE LA BIBLIOTHEQUE
// =====================================

let bibliotheque = Bibliotheque()

print("=====================================")
print("       BIBLIOTHEQUE CHCL")
print("=====================================")


// =====================================
// 2. AJOUT DES LIVRES
// =====================================

let livre1 = LivrePapier(
    titre: "Les Miserables",
    auteur: "Victor Hugo",
    nombrePages: 500
)

let livre2 = LivreNumerique(
    titre: "Swift Programming",
    auteur: "Apple",
    tailleFichierMo: 25.5
)

let livre3 = LivrePapier(
    titre: "Le Petit Prince",
    auteur: "Antoine de Saint-Exupery",
    nombrePages: 120
)

bibliotheque.ajouterLivre(livre1)
bibliotheque.ajouterLivre(livre2)
bibliotheque.ajouterLivre(livre3)


// =====================================
// 3. CREATION D'UN ADHERENT
// =====================================

let adherent1 = Adherent(nom: "Jean Max")


// =====================================
// 4. AFFICHER LE CATALOGUE
// =====================================

bibliotheque.afficherCatalogue()


// =====================================
// 5. EMPRUNTER UN LIVRE
// =====================================

print("\n===== PREMIER EMPRUNT =====")

adherent1.emprunterLivre(livre1)


// =====================================
// 6. ESSAYER D'EMPRUNTER UN LIVRE
//    DEJA EMPRUNTE
// =====================================

print("\n===== TEST DE DISPONIBILITE =====")

adherent1.emprunterLivre(livre1)


// =====================================
// 7. AUTRES EMPRUNTS
// =====================================

print("\n========= AUTRES EMPRUNTS =========")

adherent1.emprunterLivre(livre2)
adherent1.emprunterLivre(livre3)


// =====================================
// 8. TESTER LA LIMITE DE 3 LIVRES
// =====================================

print("\n===== TEST LIMITE =====")

let livre4 = Livre(
    titre: "Introduction a Swift",
    auteur: "Arly"
)

bibliotheque.ajouterLivre(livre4)

adherent1.emprunterLivre(livre4)


// =====================================
// 9. AFFICHER LES EMPRUNTS
// =====================================

adherent1.afficherEmprunts()


// =====================================
// 10. RETOURNER UN LIVRE
// =====================================

print("\n===== RETOUR D'UN LIVRE =====")

adherent1.retournerLivre(livre1)


// =====================================
// 11. AFFICHER LES EMPRUNTS FINAUX
// =====================================

adherent1.afficherEmprunts()


// =====================================
// 12. RECHERCHER UN LIVRE
// =====================================

print("\n===== RECHERCHE =====")

if let livreTrouve = bibliotheque.rechercherLivre(
    titre: "Swift Programming"
) {
    livreTrouve.afficherInformations()
}

print("\n===== FIN DU PROGRAMME =====")
