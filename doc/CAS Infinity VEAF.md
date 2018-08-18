# CAS Infinity VEAF - cr�ation de zones de combat pour l'entrainement   

Le script [CAS Infinity VEAF.lua](../scripts/CAS Infinity VEAF.lua) permet de g�n�rer facilement des zones de combat al�atoires, pour permettre un entrainement sur mesure.
En fonction du type d'entrainement souhait� et d'appareil pilot�, il est possible de choisir des cibles faciles � abattre, ou tr�s fortement d�fendues.

## Mission Maker

TODO

## Utilisation

### Principe

Pour g�n�rer une zone de CAS, il suffit de cr�er un marker sur la carte F10, de mettre dans le texte de ce marker un texte qui repr�sente une commande, et enfin de cliquer � l'ext�rieur du marker pour le valider.

La commande qui est reconnue par ce script est :

> create ao

Les param�tres sont de la forme *param�tre* *valeur*, s�par�s les uns des autres (et de la commande) par des virgules.
Exemple :

> create ao, size 3, sam 1, armor 0

### Liste des param�tres et valeurs par d�faut

Chacun des param�tres poss�de une valeur par d�faut. Si le param�tre est omis, c'est cette valeur qui sera utilis�e.

#### size

R�gle la taille du groupe

Valeur par d�faut : 1
Champ d'application : 1 � 5

En modifiant ce param�tre, on peut cr�er des groupes de 2 � 5 fois plus grand que la taille par d�faut.
Attention : comme les groupes sont g�n�r�s al�atoirement, la taille r�elle peut diff�rer de ce que le param�tre signifie.

#### sam

R�gle la difficult� de la mission en changeant les d�fenses anti-a�riennes du groupe.
Attention : pour les pilotes d'h�licopt�re, voir aussi le param�tre *armor*

Valeur par d�faut : 1
Champ d'application : 0 � 5

A z�ro, aucune d�fense n'est g�n�r�e.
Entre 1 et 3, on augmente progressivement le nombre de d�fenses sans changer la fr�quence de distribution statistique (qui gouverne le type de d�fense g�n�r�).
En passant � 4, puis 5, on augmente �galement la probabilit� que les d�fenses soient plus coriaces (par exemple il devient moins rare de voir des SA-15)

#### armor

R�gle le type de blind�s g�n�r�s. 

Valeur par d�faut : 1
Champ d'application : 0 � 5

A z�ro, aucun blind� n'est g�n�r�.
En augmentant la valeur, les blind�s g�n�r�s sont de plus en plus lourds et dangereux.
Attention : comme les groupes sont g�n�r�s al�atoirement, il est possible (quoi que peu probable) d'avoir des T90 dans un groupe *armor 1* ou de n'avoir que des BRDM dans un groupe *armor 5*. 

#### spacing

R�gle l'espacement des unit�s et la taille de la zone.
Valeur par d�faut : 3
Champ d'application : 1 � 5

Pour chaque type d'unit� (fantassin, transport, blind�, d�fense), la taille par d�faut de la zone de placement diff�re. 
En modifiant ce param�tre, il est possible de r�duire (2, voire 1) ou d'augmenter (4, ou 5) la taille de cette zone, et donc d'espacer moins ou plus les unit�s.

## R�gles de g�n�ration

TODO