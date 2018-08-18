# Artillerie pour la mission opentraining   

Le script [arty_opentraining.lua](../scripts/arty_opentraining.lua) permet de g�rer des batteries d'artillerie.
Il utilise le module *arty* de l'excellent [*Moose*](https://github.com/FlightControl-Master/MOOSE).
Je n'ai pas fait grand chose d'autre que de d�finir des groupes (batteries) et de les initialiser pour que *Moose* permette de les g�rer. 
Vous trouverez la documentation compl�te du module [ici](https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Functional.Arty.html).

## Mission Maker

TODO

## Utilisation

### Principe

Pour commander les batteries d'artillerie, il suffit de cr�er un marker sur la carte F10, de mettre dans le texte de ce marker un texte qui repr�sente une commande, et enfin de cliquer � l'ext�rieur du marker pour le valider.

Les commandes qui sont reconnues par ce script sont :

> arty engage

> arty move

> arty request

> arty cancel

Les param�tres sont de la forme *param�tre* *valeur*, s�par�s les uns des autres (et de la commande) par des virgules.
Exemple :

> arty engage, everyone, shots 50

### Liste des unit�s disponibles

- Alpha 1 ; artillerie de campagne (howitzer) ; clusters Alpha et Short
- Alpha 2 ; artillerie de campagne (howitzer) ; clusters Alpha et Short
- Bravo 1 ; artillerie de campagne (howitzer) ; clusters Bravo et Short
- Bravo 2 ; artillerie de campagne (howitzer) ; clusters Bravo et Short
- Long 1 ; lance roquettes multiples (MLRS) ; cluster Long
- Long 2 ; lance roquettes multiples (MLRS) ; cluster Long
- Perry 1 ; Fr�gate [Oliver Hazard Perry](https://en.wikipedia.org/wiki/Oliver_Hazard_Perry-class_frigate) ; cluster Perry
- Perry 2 ; Fr�gate [Oliver Hazard Perry](https://en.wikipedia.org/wiki/Oliver_Hazard_Perry-class_frigate) ; cluster Perry

### Liste des commandes et de leurs param�tres (non exhaustive)

#### arty engage

D�clenche une frappe d'artillerie sur l'emplacement du marqueur (ou ailleurs, voir param�tre *lldms*).

##### batteries

D�termine les unit�s qui vont engager le combat.
Il peut valoir *everyone* (ou *allbatteries*) pour engager toutes les batteries disponibles.
On peut aussi pr�ciser un cluster (groupement de batteries, voir liste des batteries) en pr�cisant *cluster* "*nom du cluster*"
Exemple : 
> arty engage, cluster "long"

Il est �galement possible de choisir une batterie (voir liste des batteries) en pr�cisant *battery* "*nom de la batterie*"
Exemple : 
> arty engage, battery "Alpha 1"

##### time 

Ce param�tre permet de diff�rer l'engagement. 
Il s'utilise comme dans l'exemple :
> arty engage, time 23:17 

##### shots

Nombre de munitions tir�es (globalement, par toutes les unit�s participant � l'engagement).
> arty engage, shots 28

##### maxengage

Nombre de fois que la cible sera engag�e (par d�faut 1).
> arty engage, maxengage 4

##### radius

Rayon de dispersion des munitions, en m�tres (par d�faut 100).
> arty engage, radius 500

##### weapon 

Arme employ�e. Permet de choisir entre les diff�rentes armes et munitions disponibles.
> arty engage, weapon smokeshells

> arty engage, weapon nuke

##### lldms

Permet de sp�cifier les coordonn�es de l'engagement. Le marker d'origine disparait et un nouveau marker apparait � l'emplacement sp�cifi�.
> arty engage, lldms 41:15:10N 44:17:22E

#### arty move

Fait se d�placer la batterie vers le marker.

##### time 

Ce param�tre permet de diff�rer le d�placement 
Il s'utilise comme dans l'exemple :
> arty move, time 23:17

##### speed 

Vitesse de d�placement en km/h.

##### batteries

D�termine les unit�s qui vont se d�placer.
Il peut valoir *everyone* (ou *allbatteries*) pour d�placer toutes les batteries disponibles.
On peut aussi pr�ciser un cluster (groupement de batteries, voir liste des batteries) en pr�cisant *cluster* "*nom du cluster*"
Exemple : 
> arty move, cluster "long"

Il est �galement possible de choisir une batterie (voir liste des batteries) en pr�cisant *battery* "*nom de la batterie*"
Exemple : 
> arty move, battery "Alpha 1"

##### lldms

Permet de sp�cifier les coordonn�es du d�placement. Le marker d'origine disparait et un nouveau marker apparait � l'emplacement sp�cifi�.
> arty move, lldms 41:15:10N 44:17:22E

#### arty request

##### batteries

D�termine les unit�s qui vont se r�pondre.
Il peut valoir *everyone* (ou *allbatteries*) pour interroger toutes les batteries disponibles.
On peut aussi pr�ciser un cluster (groupement de batteries, voir liste des batteries) en pr�cisant *cluster* "*nom du cluster*"
Exemple : 
> arty request, cluster "long"

Il est �galement possible de choisir une batterie (voir liste des batteries) en pr�cisant *battery* "*nom de la batterie*"
Exemple : 
> arty request, battery "Alpha 1"

##### target

Demande des informations sur la cible actuelle des batteries.

##### move  

Demande des informations sur le d�placement des batteries.

##### ammo

Demande des informations sur les stocks de munitions.

#### arty cancel

Permet d'annuler la commande actuelle. Il est �galement possible de simplement supprimer le marker.

##### batteries

D�termine les unit�s qui vont se r�pondre.
Il peut valoir *everyone* (ou *allbatteries*) pour interroger toutes les batteries disponibles.
On peut aussi pr�ciser un cluster (groupement de batteries, voir liste des batteries) en pr�cisant *cluster* "*nom du cluster*"
Exemple : 
> arty request, cluster "long"

Il est �galement possible de choisir une batterie (voir liste des batteries) en pr�cisant *battery* "*nom de la batterie*"
Exemple : 
> arty request, battery "Alpha 1"


