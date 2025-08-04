<div class="titlingpage">
<p align="center">
  <img width="1280" height="640" alt="logo" src="https://github.com/user-attachments/assets/17c6ef19-63cb-434b-9013-e14bc72a261d" />

<img width="100" height="100" alt="processing_logo" src="https://github.com/user-attachments/assets/a0c99424-9009-47cc-9465-a88a3c33d97e" />

</p>

</div>

# Introduzione

## Il vidoegioco originale

Super Mario Bros. è un videogioco di genere platform in 2D, sviluppato
da Nintendo e rilasciato su cartuccia nel 1985 per NES. Nato dalla mente
di Shigeru Miyamoto, è considerato uno dei capolavori della storia dei
videogiochi. Con più di 380 milioni di copie vendute, ha rivoluzionato
il mercato videoludico.  

  <p align="center">
<img width="400" alt="super_mario_bros _cartridge" src="https://github.com/user-attachments/assets/0c0cfda6-556b-4d93-b729-83f5fe3a1b71" alt="Cartuccia per NES del gioco Super Mario Bros., rilasciato nel 1985." />
  </p>

Il gioco consiste in livelli di crescente difficoltà, in cui Mario deve
affrontare nemici e ostacoli, sfruttando i potenziamenti scovati lungo
il percorso. Il gameplay si fonda sull’idea semplice e geniale del salto
combinato al movimento orizzontale. Questa meccanica, facile e
coinvolgente, viene amplificata dalle abilità date dai power up. Il
gioco, pur essendo basato su regole di movimento elementari, risulta
sempre stimolante e divertente, motivo per il quale è considerato un
capolavoro senza tempo.  
Il gioco, sebbene presenti una trama quasi inesistente, prevede che
Mario salvi la principessa del Regno dei Funghi, rapita dell’antagonista
Bowser. Questo cliché è diventato il punto di partenza di gran parte dei
giochi della saga.  
I nemici, aumentati in numero e quantità nel corso degli ani, sono
caratterizzati da comportamenti diversi a seconda della specie. Tra i
più famosi, anche nella cultura popolare, spiccano sicuramente i Goomba
e i Koopa, che appaiono già nel primo livello del gioco.  

## Il remake in Processing

Il remake di Super Mario Bros. è stato sviluppato utilizzando la
libreria grafica Processing 4, basata su Java, prendendo ispirazione dal
gioco originale rilasciato nel 1985. Tuttavia, presenta notevoli
differenze rispetto ad esso, sia dal punto di vista tecnico che da
quello del design dei livelli.  
Tra le variazioni tecniche più evidenti, spiccano la dimensione della
finestra di gioco, aggiornata in risoluzione Full HD (1920x1080), e il
frame rate impostato a 60 Hz. Anche l’aspetto sonoro è stato rivisto,
con alcune musiche ed effetti sostituiti da versioni rimasterizzate, di
qualità superiore rispetto agli originali. Gli asset grafici sono stati
aggiornati, mantenendo un’ottima fedeltà agli elementi originali.  

<img width="1920" height="1080" alt="level_1_screen_1" src="https://github.com/user-attachments/assets/d3e2022e-66f2-4ff6-aadc-ff11206dfcee" />

  
  
Attualmente in uno stato alpha, il remake presenta ancora alcune lacune
rispetto al gioco originale per NES, come la mancanza di alcuni nemici,
power up, scenari e meccaniche. Tuttavia, risulta giocabile e fruibile
senza evidenti problemi. Nonostante le mancanze, le principali funzioni
di gioco sono accessibili e i livelli proposti, sebbene inediti rispetto
all’originale, mantengono le medesime meccaniche di gameplay.

# Analisi del remake

## Elementi di gioco implementati

In questa sezione verrano analizzati gli elementi di gioco implementati.

-   <div class="singlespace">

    **Ground**

    </div>

    Il blocco *Ground* rappresenta un blocco indistruttibile all’interno
    del gioco. Se un’entità entra in contatto con questo blocco, non può
    oltrepassarlo. Viene utilizzato come base dei livelli.
    
<img width="120" height="120" alt="1x1_ground" src="https://github.com/user-attachments/assets/0f2da4db-3f54-4e0e-951d-f5fc4a12176e" />

-   <div class="singlespace">

    **Block**

    </div>

    Il blocco *Block* rappresenta un blocco distruttibile se colpito con
    un valore di forza maggiore o uguale a 3. Se un’entità entra in
    contatto con questo blocco, non può oltrepassarlo.
    
<img width="120" height="120" alt="1x1_block" src="https://github.com/user-attachments/assets/42aa2d8a-f6bd-455f-a978-bdc7e281a575" />

-   <div class="singlespace">

    **Brick**

    </div>

    Il blocco *Brick* rappresenta un blocco distruttibile se colpito con
    un valore di forza maggiore o uguale a 2. Se un’entità entra in
    contatto con questo blocco, non può oltrepassarlo.

<img width="120" height="120" alt="1x1_brick" src="https://github.com/user-attachments/assets/0ba8b635-715b-4156-8f24-3c709d437db5" />

-   <div class="singlespace">

    **Question Block**

    </div>

    Il blocco *Question Block* rappresenta un blocco distruttibile se
    colpito con un valore di forza maggiore o uguale a 2. Se un’entità
    entra in contatto con questo blocco, non può oltrepassarlo. Se viene
    colpito con un valore di forza maggiore o uguale a 1, cambia stato,
    rilasciando il power up equipaggiato.

<img width="120" height="120" alt="question_block_1" src="https://github.com/user-attachments/assets/cd2901a1-bf4e-47b1-8e35-02820d9f88ed" />

-   <div class="singlespace">

    **Goomba**

    </div>

    Il *Goomba* rappresenta un nemico che, muovendosi orizzontalmente,
    può attaccare il giocatore se riesce a colpirlo con il suo lato
    destro, sinistro o inferiore. Può subire danno se colpito dall’alto
    o con dei power up.

<img width="90" height="90" alt="lx_goomba_neutral" src="https://github.com/user-attachments/assets/79af075b-4215-4b13-8a8c-94c62db44481" />

-   <div class="singlespace">

    **Green Koopa Troopa**

    </div>

    Il *Green Koopa Troopa* rappresenta un nemico che, muovendosi
    orizzontalmente, può attaccare il giocatore se riesce a colpirlo con
    il suo lato destro, sinistro o inferiore. Può subire danno se
    colpito con dei power up. Se colpito sul lato superiore entra nello
    stato guscio. Dopo alcuni secondi in questo stato, se non viene
    colpito, torna a muoversi normalmente. Se colpito nello stato di
    guscio, inizia a muoversi a velocità maggiore con una forza
    orizzontale di 2. Se colpito mentre in movimento nello stato guscio
    torna a rimanere statico.

<img width="90" height="135" alt="lx_green_koopa_troopa_1" src="https://github.com/user-attachments/assets/1318a1cd-64d0-468b-8830-e73202ee47d8" />

-   <div class="singlespace">

    **Coin**

    </div>

    Il *Coin* rappresenta un power up statico. Se colpito dal giocatore
    aggiunge una moneta all’inventario. Con 100 monete il giocatore
    guadagna una vita.

<img width="51" height="90" alt="coin_0" src="https://github.com/user-attachments/assets/19c047db-49c6-4e7c-aec5-c792bda139a2" />

-   <div class="singlespace">

    **Super Mushroom**

    </div>

    Il *Super Mushroom* rappresenta un power up che si muove nel livello
    orizzontalmente. Se colpito dal giocatore lo potenzia a Super Mario.

<img width="90" height="90" alt="super_mushroom" src="https://github.com/user-attachments/assets/85b4b741-1ae7-41a3-a1e2-727a73bcfe99" />

-   <div class="singlespace">

    **One Up Mushroom**

    </div>

    Il *One Up Mushroom* rappresenta un power up che si muove nel
    livello orizzontalmente. Se colpito dal giocatore aumenta di uno il
    numero delle vite.

<img width="90" height="90" alt="one_up_mushroom" src="https://github.com/user-attachments/assets/aee75851-f0ff-48c1-95a7-4902c72c81e0" />

-   <div class="singlespace">

    **Fire Flower**

    </div>

    Il *Fire Flower* rappresenta un power up statico. Se colpito dal
    giocatore lo potenzia a Fire Mario.

<img width="90" height="90" alt="fire_flower_2" src="https://github.com/user-attachments/assets/0e6e08bd-74d3-4c7f-9088-88d8036195c0" />

-   <div class="singlespace">

    **Mario**

    </div>

    Il livello di abilità *Mario* rappresenta il livello di
    potenziamento minimo del giocatore. In questo stato, Mario è più
    piccolo della sua versione Super. Se colpito da un nemico muore
    immediatamente. Il suo livello di forza superiore è pari a 1, mentre
    la forza degli altri lati è 0.

<img width="100" height="123" alt="lx_mario" src="https://github.com/user-attachments/assets/aa795857-73d8-4325-95db-b0503b62ae8f" />

-   <div class="singlespace">

    **Super Mario**

    </div>

    Il livello di abilità *Super Mario* rappresenta il primo livello di
    potenziamento del giocatore. In questo stato, Mario è più grande
    della sua versione base. Se colpito da un nemico torna allo stato
    *Mario*. Il suo livello di forza superiore è pari a 2, mentre la
    forza degli altri lati è 0.

<img width="100" height="200" alt="lx_super_mario" src="https://github.com/user-attachments/assets/481e738a-95ac-4c60-ac9c-fe00af5f8afd" />

-   <div class="singlespace">

    **Fire Mario**

    </div>

    Il livello di abilità *Fire Mario* rappresenta il secondo livello di
    potenziamento del giocatore. In questo stato, Mario è della stessa
    grandezza della sua versione Super. Se colpito da un nemico torna
    allo stato *Super Mario*. Il suo livello di forza superiore è pari a
    2, mentre la forza degli altri lati è 0. Può lanciare *Fire Balls*
    ai nemici, che applicano un danno quando li interccettano.

<img width="100" height="200" alt="lx_fire_mario" src="https://github.com/user-attachments/assets/066841f1-3eaa-4901-96f7-2035f35fa6eb" />

## Controlli

Il remake, così come il gioco originale, basa i suoi controlli sulle
meccaniche tipiche dei platform: il salto e la corsa. Di seguito
verranno analizzati tutti i comandi presenti nel gioco.

-   <div class="singlespace">

    **Movimento laterale**

    </div>

    Il giocatore può muoversi a sinistra premendo e a destra premendo .
    Il movimento, meccanica fondamentale nei platform, permette al
    giocatore di esplorare il livello ed interagire con esso.


-   <div class="singlespace">

    **Corsa**

    </div>

    Il giocatore può incrementare la propria velocità di movimento
    premendo in combinazione con o . La corsa permette al giocatore di
    superare nemici, burroni e ostacoli.


-   <div class="singlespace">

    **Salto**

    </div>

    Il giocatore può saltare premendo . Premendo il tasto per poco tempo
    si effettuerà un salto normale, mentre tenendolo premuto più a lungo
    sarà possibile fare un super salto. Combinato con il movimento, il
    salto risulta una meccanica fondamentale all’interno di un platform.


-   <div class="singlespace">

    **Lancio delle palle di fuoco**

    </div>

    Il giocatore può lanciare palle di fuoco premendo quando è *Fire
    Mario*. Premendo il tasto, Mario lancierà delle palle di fuoco che
    attaccheranno i nemici.


-   <div class="singlespace">

    **Pausa e uscita dal gioco**

    </div>

    È possibile mettere in pausa il gioco premendo all’interno di un
    livello. Si aprirà quindi un menù di pausa dal quale sarà possibile
    riprendere la partita premendo nuovamente o uscire premendo .


## Livelli

I livelli ricreati all’interno del remake sono frutto di fantasia,
sebbene siano ispirati a quelli del gioco originale. Di seguito verranno
analizzati e descritti brevemente.

-   <div class="singlespace">

    **Livello iniziale**

    </div>

    Il livello iniziale funge da menù principale del remake. È possibile
    accedervi all’avvio del gioco o al completamento dell’ultimo
    livello. È l’unico livello a nascondere l’HUD e a riprodurre un
    suono differente rispetto a quello di default quando si colpisce la
    bandiera di fine livello. Mostra a schermo il logo del remake e i
    comandi di gioco.
    
<img width="1920" height="1080" alt="initial_level" src="https://github.com/user-attachments/assets/e506e376-d6ec-42ef-bd36-185391aee62b" />


-   <div class="singlespace">

    **Level 1**

    </div>

    *Level 1* rappresenta il primo livello del gioco. È diviso in
    microsezioni separate da burroni. All’interno del livello è
    possibile ottenere un *Super Mushroom* e un *One Up Mushroom*.
    Prende ispirazione dai livelli del gioco originale ambientati
    nell’overworld.
    
<img width="1920" height="1080" alt="level1" src="https://github.com/user-attachments/assets/aaba9206-fe25-4e83-b42a-adc9bc58b30f" />

-   <div class="singlespace">

    **Level 2**

    </div>

    *Level 2* rappresenta il secondo livello del gioco. È incentrato sul
    parkour e richiede una buona abilità nell’attaccare e saper
    utilizzare a proprio vantaggio i nemici. All’interno del livello è
    possibile ottenere un *Fire Flower*. Prende ispirazione dai livelli
    più moderni della saga.

<img width="1920" height="1080" alt="level2" src="https://github.com/user-attachments/assets/5c651b80-8c92-4053-a505-9ef99d2fb5cf" />

-   <div class="singlespace">

    **Level 3**

    </div>

    *Level 3* rappresenta il terzo e ultimo livello del gioco. Essendo
    il livello finale, presenta alcune peculiarità, come una versione
    remixata della classica OST del gioco. Il livello contiene, inoltre,
    molti nemici Goomba, sui quali il giocatore potrà provare l’abilità
    del *Fire Flower*. Con il quantitativo di monete presenti nel
    livello, e morendo un numero di volte sufficienti, sarà possibile
    raggiungere le 100 unità, guadagnando una vita extra. Al
    raggiungimento della bandiera il giocatore verrà riportato al
    livello iniziale.

<img width="1920" height="1080" alt="level3" src="https://github.com/user-attachments/assets/52b01024-a5fa-4be6-8d3e-94898c4d9763" />

## Schermate di gioco

Oltre ai livelli precedentemente analizzati, il gioco presenta alcune
schermate di gioco che forniscono informazioni di vario genere al
giocatore.

-   <div class="singlespace">

    **Schermata di caricamento del livello**

    </div>

    In questa schermata vengono mostrati, in ordine, il nome del livello
    successivo (o di quello corrente nel caso in cui lo si stia
    ricominciando dopo essere morti), il numero di vite e il numero di
    monete raccolte. Questa schermata appare nel caso in cui il
    giocatore raggiunga la bandiera di fine livello o nel caso in cui
    muoia, ma abbia ancora delle vite.
    
<img width="1920" height="1080" alt="Load Level Screen" src="https://github.com/user-attachments/assets/7ea0388c-5abb-445d-b669-c6f590269dd4" />

-   <div class="singlespace">

    **Schermata di Game Over**

    </div>

    Questa schermata appare nel caso in cui il giocatore muoia e non
    abbia più altre vite a disposizione.

<img width="1920" height="1080" alt="Game over screen" src="https://github.com/user-attachments/assets/20ab1210-626c-40dc-8967-beb8900c7731" />

-   <div class="singlespace">

    **Schermata di pausa**

    </div>

    Questa schermata appare nel caso in cui venga premuto il tasto e
    rappresenta il menù di pausa. Il testo mostrato a schermo indica
    come riprendere la partita o uscire dal gioco.

<img width="1920" height="1080" alt="Pause menu" src="https://github.com/user-attachments/assets/5e432499-7341-4678-ab18-389e6197532d" />

-   <div class="singlespace">

    **HUD delle vite**

    </div>

    Questo HUD fornisce informazioni riguardo al numero di vite a
    disposizione del giocatore. È posto in alto a sinistra ed è presente
    in tutti i livelli ad esclusione di quello di inizio.

<img width="247" height="139" alt="Life Hud" src="https://github.com/user-attachments/assets/91b816ee-ce5d-4d2c-9364-ede5d6e86d8b" />

-   <div class="singlespace">

    **HUD delle monete**

    </div>

    Questo HUD fornisce informazioni riguardo al numero di monete
    raccolte dal giocatore. È posto in alto a sinistra, a fianco
    dell’HUD delle vite, ed è presente in tutti i livelli ad esclusione
    di quello di inizio.

<img width="223" height="125" alt="Coin hud" src="https://github.com/user-attachments/assets/caf3ddb8-fadd-4048-b39b-17740701647b" />

# Sviluppo e aspetti tecnici

## Strumenti di sviluppo

Lo sviluppo del remake è stato realizzato utilizzando Processing 4. Il
linguaggio, basato su Java, possiede un IDE proprietario che permette,
oltre allo sviluppo, la possibilità di esportare il gioco compilato o di
installare librerie. Tuttavia nello sviluppo del codice è stato
utilizzato l’editor di testo Visual Studio Code con l’ausilio del plugin
*Processing VSCode*. Questo editor, infatti, presenta funzioni di aiuto
allo sviluppo ben più avanzate rispetto all’IDE ufficiale.

<img width="1920" height="1029" alt="VSCode example" src="https://github.com/user-attachments/assets/b23f3221-bc24-4cda-b2d8-820de822794e" />


  
Nella realizzazione del remake, è stato utilizzato il sitema di
controllo delle versioni GIT, in combinazione con il servizio online
GitHub. Il codice e gli assets, insieme alle commit effettuate e alle
release, sono accessibili gratuitamente attraverso la repository GitHub
accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake).  
Per la manipolazione degli assets grafici è stato utilizzato il software
Adobe Photoshop. Molti template utilizzati per lo sviluppo, infatti,
sono accessibili in formato PSD.

<img width="1880" height="818" alt="releaseGithub" src="https://github.com/user-attachments/assets/1aaa0bb8-7f6d-4303-bb54-1aa3db6bee85" />

## Classi e codice utilizzati

Nello sviluppo del remake sono state create molte classi e frammenti di
codice che andremo ad analizzare di seguito.

### Main

La classe *Main*, sebbene non sia una vera classe, costituisce il cuore
del gioco. Contiene i metodi richiamati all’avvio dell’applicazione e
alcune variabili globali. Svolge vari compiti:

-   La fase di inizializzazione prepara il gioco, istanziando livelli,
    giocatori, suoni, timer e altri elementi necessari prima dell’avvio.

-   Gestisce le schermate del gioco, come il caricamento dei livelli, il
    game over e la pausa.

-   Si occupa dell’aggiornamento e del disegno dei livelli, garantendo
    che gli elementi di gioco siano aggiornati e visualizzati
    correttamente sullo schermo.

-   Gestisce gli input dell’utente, inclusi i tasti premuti e
    rilasciati, per consentire l’interazione con il gioco.

Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Main.pde),
ma di seguito è disponibile quello del metodo draw(). Il metodo draw
risulta particolarmente importante, in quanto si occupa di gestire le
varie scene mostrate a schermo con l’ausilio di timer e controlli.

<div class="tcolorbox">

``` java
void draw() {
  if (!player.isDead) { // When the player is not dead
    if (level.isFinished) {
      if (loadLevelScreenTimeDuration.tick()) {
        if (level.id + 1 < levels.size()) {
          level = levels.get(level.id + 1);
          player.reset();
        } else {
          level = levels.get(0);
          for (Level level : levels) {
            level.reset();
          }
          player.resetGameOver();
        }
        player.immunity = false;
        level.startLevel();
        newLevelAnimationLevelTimeDuration.reset();
        loadLevelScreenTimeDuration.reset();
        drawLevel();
      } 
```

</div>

<div class="tcolorbox">

``` java
    else {
        newLevelAnimationLevelTimeDuration.update();
        if (newLevelAnimationLevelTimeDuration.tick()) { 
          loadLevelScreenTimeDuration.update();
          loadLevelDraw();
        } else {
          player.stopX();
          player.jump = false;
          player.immunity = true;
          drawLevel();
        }      
      }  
    } else {
      if (pause) {
        if (pauseKeyTimeDuration.tick()) {
          pauseKeyFalse();
          if (getKeyStatus("e_key") || getKeyStatus("E_key")) {
            exit();
          }
        } else {
          pauseKeyTimeDuration.update();
        }

        pauseDraw();
        if (!pause) {
          level.music.play();
        } else {
          level.music.pause();
        }
        
      } else {
        if (pauseKeyTimeDuration.tick()) {
          pauseKeyTrue();
        } else {
          pauseKeyTimeDuration.update();
        }
        
        drawLevel();
      }
      
    }
  } 
```

</div>

<div class="tcolorbox">

``` java
else if (player.lives <= 0)  // When the player runs out of lives 
{
    if (gameOverScreenTimeDuration.tick()) {
      player.immunity = false;
      level = levels.get(0);
      for (Level level : levels) {
        level.reset();
      }
      level.startLevel();
      levelNameString.replace(0, levelNameString.length(), level.name);
      player.resetGameOver();
      gameOverScreenTimeDuration.reset();
      deathAnimationLevelTimeDuration.reset();
    } else {
      deathAnimationLevelTimeDuration.update();
      if (deathAnimationLevelTimeDuration.tick()) {
        if (gameOverScreenTimeDuration.elapsed == 0) {
          game_over_effect.play();
        }
        gameOverScreenTimeDuration.update();
        gameOverDraw();
      } else {
        player.immunity = true;
        drawLevel();
      }      
    }
  } 
  else //When the player dies
  { 
    if (loadLevelScreenTimeDuration.tick()) {
      player.immunity = false;
      level.startLevel();
      player.resetDead();
      loadLevelScreenTimeDuration.reset();
      deathAnimationLevelTimeDuration.reset();
    } else {
      deathAnimationLevelTimeDuration.update();
      if (deathAnimationLevelTimeDuration.tick()) {
        loadLevelScreenTimeDuration.update();
        loadLevelDraw();
      } else {
        player.immunity = true;
        drawLevel();
} } } }
```

</div>

### Sprite

La classe *Sprite* gestisce gli sprite all’interno del gioco. Contiene
variabili per la texture, la larghezza e l’altezza dello sprite, la sua
posizione e velocità. La classe include anche metodi per rilevare
collisioni con altri sprite, per aggiornare le animazioni e per
disegnare lo sprite sullo schermo. Inoltre, fornisce funzioni per
controllare e fermare il movimento sia orizzontale che verticale dello
sprite, nonché per calcolare le posizioni centrali orizzontali e
verticali dello sprite. Da questa classe eridatano la maggior parte
delle altre classi del gioco.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Sprite.pde),
ma in questa sezione andremo ad analizzare alcuni metodi degni di
nota.  
Per gestire le animazioni dello sprite è possibile utilizzare il metodo
*animation*. Questo metodo accetta come parametri il set di immagini
dell’animazione e la frequenza di cambiamento dei frame.

<div class="tcolorbox">

``` java
void animation(ArrayList<PImage> currentFrameSet, int frameFrequency) {
    this.currentFrameSet = currentFrameSet;
    this.frameFrequency = frameFrequency;
    texture = currentFrameSet.get(0);
    frameCount = 0;
    currentFrame = 0;
}
```

</div>

Una volta impostata una animazione, questa viene gestita dal metodo
*update*. La texture viene aggiornata in base al set di frame e alla
frequenza di aggiornamento.

<div class="tcolorbox">

``` java
void update() {
    position.y += speed.y;
    position.x += speed.x;

    if (frameFrequency > 0) {
        if (frameCount >= frameFrequency) {
            currentFrame = (currentFrame + 1) % currentFrameSet.size();
            frameCount = 0;
            texture = currentFrameSet.get(currentFrame);
        }
        frameCount += 1;
    }
}
```

</div>

Vale la pena analizzare anche il sistema di rilevamento delle
collisioni. Le collisioni tra due sprite vengono analizzate su tutti e
quattro i lati separatamente, in modo da poter essere gestite in maniera
differente. Utilizzano un sistema di tolleranza che permette di rilevare
la collisione solo entro un certo numero di pixel. Di seguito il metodo
per gestire la collisione verso il basso.

<div class="tcolorbox">

``` java
boolean collideDown(Sprite sprite) {
    boolean downCollisionTemp = false;
    if (sprite.position.y - (position.y + height) <= 0 &&
        sprite.position.y - (position.y + height) > -collisionFraction &&
        sprite.position.x - (position.x + width) < 0 &&
        (sprite.position.x + sprite.width) - position.x > 0)
    {
        downCollisionY = sprite.position.y - height;
        downCollisionTemp = true;
    }
    return downCollisionTemp;
}
```

</div>

### Entity

La classe *Entity* estende la classe *Sprite* e gestisce le entità nel
gioco. Gestisce le collisioni, evitando che avvengano compenetrazioni e
quindi limitando il movimento quando necessario. La classe si occupa di
gestire la meccanica di salto, la gravità e il movimento automatico
delle entità autonome.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Entity.pde),
ma in questa sezione andremo ad analizzare il metodo update, che
contiene la logica di salto. Il salto viene gestito basandosi sulle
collisioni correnti, l’input di salto e i timeout di salto. Grazie a
questi controlli è possibile gestire sia il salto normale che il super
salto.

<div class="tcolorbox">

``` java
void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
    
    super.update();
    
    if (exceedsLowerBound()) {
        this.takeDamage(-1);
    } else {
        
        checkCollisions(platforms, powerUps);
```

</div>

<div class="tcolorbox">

``` java
        if (!downCollision && jumpStatus == 0 ) {
            applyGravity();
        } else if ((jump || jumpStatus > 0) && jumpTimeout == 0) {
            if (jumpStatus<jumpValue && !upCollision) {
                jumpStatus += 1;
                jump = false;
                applyInvertedGravity();
            } else if (jump && jumpValue == smallJumpValue && jumpStatus > 3) {
                jumpValue = superJumpValue;
            } else {
                jumpValue = smallJumpValue;
                jumpStatus = 0;
                jump = false;
                jumpTimeout = JUMP_TIMEOUT_VALUE;
            }
        } else {
            stopY();
        }
        if (jumpTimeout > 0 && downCollision) {
            jump = false;
            jumpTimeout -= 1;
        }
    }
}
```

</div>

### Player

La classe *Player* si occupa di gestire il personaggio del giocatore nel
gioco. Estende la classe *Entity* e contiene variabili per gestire vite,
monete, potenziamenti e altro ancora. La classe include metodi per
gestire il movimento del giocatore, la raccolta delle monete, la
gestione dei danni, la morte del giocatore e l’aggiornamento dell’HUD.
Inoltre, gestisce la logica per i potenziamenti del giocatore e la
capacità di lanciare le palle di fuoco.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Player.pde),
ma in questa sezione verranno analizzati alcuni metodi particolarmente
importanti.  
Il metodo *takeDamage* si occupa di gestire la situazione in cui il
giocatore viene attaccato. Ha come parametro una variabile int che
rappresenta il valore del danno. Si occupa di gestire la morte del
player o il suo cambiamento di abilità a seconda del danno subito.

<div class="tcolorbox">

``` java
@Override
void takeDamage(int damage) {
    super.takeDamage(damage);
    if (!immunity) {
        if (damage == -1) {
            die();
        } else {
            if (damageTimeout == DAMAGE_TIMEOUT_VALUE) {
                if (powerLevel - damage == 0 ) {
                    die();
                } else {
                    powerLevel -= damage;
                    pipe_effect.play();
                    if (powerLevel == 1) {
                        basePower();
                    } else if (powerLevel == 2) {
                        superMushroomPower();
                    }
                }
                damageTimeout = 0;
            }
        }
   }
}
```

</div>

Il metodo *getLife*, simile al metodo *coin*, gestisce il guadagno di
una vita da parte del giocatore e richiama il metodo *updateLifeHud* per
aggiornare l’HUD.

<div class="tcolorbox">

``` java
void getLife() {
    if (lives < 99) {
        lives += 1;
        one_up_effect.play();
        updateLifeHud();
    }
}
```

</div>

Il metodo *updateLifeHud* si occupa di aggiornare la stringBuilder che
verrà poi mostrata come HUD. Per farlo controlla se il numero di vite
sia minore di 10, in modo da mostrare uno 0 davanti alla cifra nel caso
in cui il valore sia a cifra singola.

<div class="tcolorbox">

``` java
void updateLifeHud() {
    if (lives < 10) {
        lifeHudString.replace(lifeHudString.length()-2, lifeHudString.length(), "0" + lives);
    } else {
        lifeHudString.replace(lifeHudString.length()-2, lifeHudString.length(), "" + lives);
    }
}
```

</div>

### FireBall

La classe *FireBall* gestisce le palle di fuoco lanciate da Mario ed
eredita della classe *Entity*. Si occupa di gestire il movimento della
palla di fuoco e il suo rimbalzo. Inoltre uccide l’entità dopo un numero
massimo di rimbalzi o dopo una collisione.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/FireBall.pde).

### Enemy

La classe *Enemy* estende la classe *Entity* e gestisce i nemici nel
gioco. Include variabili per la salute e il danno inflitto. Gestisce i
danni subiti dal giocatore e l’eventuale morte. Inoltre gestisce le
collisioni con altri nemici e con le palle di fuoco.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Enemy.pde).

### Goomba

La classe *Goomba* estende la classe *Enemy* e gestisce i nemici di tipo
Goomba nel gioco. Utilizza il movimento automatico in orizzontale per i
suoi spostamenti, partendo dalla direzione specificata nel costruttore.
Si occupa di infliggere e subire danno all’interno dell’update.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Goomba.pde).

### Koopa

La classe *Koopa* estende la classe *Enemy* e gestisce i nemici di tipo
Koopa nel gioco. Utilizza il movimento automatico in orizzontale per gli
spostamenti dell’entità attiva e sotto forma di guscio, partendo dalla
direzione specificata nel costruttore. Si occupa di infliggere e subire
danno all’interno dell’update. Gestisce, inoltre, i cambiamenti di stato
della tartaruga da attiva, a guscio fermo, a guscio in movimento.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Koopa.pde).

### GreenKoopaTroopa

La classe *GreenKoopaTroopa* estende la classe *Koopa* e gestisce i
nemici di tipo Green Koopa Troopa nel gioco. Sfrutta la classe da cui
eredita per effettuare tutte le sue operazioni, essendo il tipo più
semplice di Koopa.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/GreenKoopaTroopa.pde).

### PowerUp

La classe *PowerUp* estende la classe *Entity* e gestisce i
potenziamenti nel gioco. Funge da classe base per la creazione delle
sottoclassi power up che la estendono.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/PowerUp.pde).

### Coin

La classe *Coin* estende la classe *PowerUp* e gestisce le monete nel
gioco. Si occupa di gestire il guadagno di una moneta da parte del
giocatore quando viene colpita come entità. Non possiede gravità, quindi
può fluttuare nel mondo di gioco.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Coin.pde).

### SuperMushroom

La classe *SuperMushroom* estende la classe *PowerUp* e gestisce i Super
Mushroom nel gioco. Si occupa di gestire l’attivazione dell’abilità
*Super Mario* quando viene colpita come entità. Gestisce automaticamente
il movimento in orizzontale.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/SuperMushroom.pde).

### OneUpMushroom

La classe *OneUpMushroom* estende la classe *PowerUp* e gestisce gli One
Up Mushroom nel gioco. Si occupa di gestire il guadagno di una vita da
parte del giocatore quando viene colpita come entità. Gestisce
automaticamente il movimento in orizzontale.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/OneUpMushroom.pde).

### FireFlower

La classe *FireFlower* estende la classe *PowerUp* e gestisce i Fire
Flower nel gioco. Si occupa di gestire l’attivazione dell’abilità *Fire
Mario* quando viene colpita come entità. È un’entità statica per quanto
riguarda il movimento orizzontale, ma possiede un valore di gravità.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/FireFlower.pde).

### Flag

La classe *Flag* estende la classe *PowerUp* e gestisce la bandiera di
fine livello nel gioco. Si occupa di gestire la fine del livello quando
viene colpita come entità. È un’entità statica e possiede uno sprite
aggiunto che non subisce le collisioni. Quando viene colpita nella parte
superiore fa guadagnare una vita al giocatore.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Flag.pde).

### Platform

La classe *Platform* estende la classe *Sprite* e si occupa della
gestione delle piattaforme. Oltre alle proprietà che eredita, aggiunge i
valori di distruttibilità per lato, che rappresentano i valori di forza
necessari per rompere la piattaforma.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Platform.pde).

### QuestionBlock

La classe *QuestionBlock* estende la classe *Platform* e si occupa della
gestione dei Question Block. Gestisce il rilascio dei power up quando
viene colpito, gestendo parti delle collisioni dentro l’update.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/QuestionBlock.pde),
ma di seguito verrà analizzato il metodo *hitQuestionBlock*. Questo
metodo si occupa dell’effettivo rilascio del power up, calcolando la
posizione in cui farlo apparire in base alla propria.

<div class="tcolorbox">

``` java
void hitQuestionBlock() {
    this.isActive = false;
    this.emptyBlock();
    if (this.powerUp == SUPER_MUSHROOM) {
        level.powerUps.add(new SuperMushroom(this.position.x, GAME_HEIGHT - this.position.y + 90, this.isRight));
        powerup_appears_effect.play();
    } else if (this.powerUp == ONE_UP_MUSHROOM) {
        level.powerUps.add(new OneUpMushroom(this.position.x, GAME_HEIGHT - this.position.y + 90, this.isRight));
        powerup_appears_effect.play();
    } else if (this.powerUp == FIRE_FLOWER) {
        level.powerUps.add(new FireFlower(this.position.x + 15, GAME_HEIGHT - this.position.y + 90));
        powerup_appears_effect.play();
    }
}
```

</div>

### Level

La classe *Level* si occupa di gestire i livelli all’interno del gioco.
Gestisce le piattaforme, i nemici e i power up presenti nel livello,
aggiornandoli, rimuovendoli se necessario e disegnandoli a schermo. Si
occupa anche della transizione della telecamera e dell’impostazione dei
limiti del livello. Disegna a schermo gli HUD e attiva la musica del
livello al suo avvio.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Level.pde).

### Level0

La classe *Level0* estende la classe *Level* e si occupa di gestire il
livello iniziale del gioco. Questo livello, che funge da menù
principale, possiede alcune peculiarità rispetto ai livelli di default.
In questo livello, infatti, non sono presenti gli HUD, è presente un
testo a schermo con i comandi e il suono riprodotto al raggiungimento
della bandiera di fine livello è differente.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Level0.pde),
ma di seguito verranno analizzato alcuni metodi responsabili delle
modifiche specifiche di questo livello. Il primo metodo che subisce
delle modifiche è *drawHud*, al quale viene fatto l’override senza
effettuare, però, alcuna operazione. Ciò impedisce all’HUD di essere
mostrato a schermo.

<div class="tcolorbox">

``` java
@Override
void drawHud() {
}
```

</div>

Il secondo metodo che differisce dal modello di default è *draw*.
Infatti in questo metodo vengono disegnati il logo e la lista dei
comandi.

<div class="tcolorbox">

``` java
@Override
void draw() {
    super.draw();
    logo.draw();
    controls.draw();
}
```

</div>

Il terzo metodo responsabile delle caratteristiche peculiari del livello
iniziale è *finished*, che riproduce un suono differente, rispetto a
quello di default, alla fine del livello.

<div class="tcolorbox">

``` java
@Override
void finished() {
    isFinished = true;
    music.stop();
    lets_a_go_effect.play();
    newLevelAnimationLevelTimeDuration.elapsed = 350;
    updateNextLevelName();
}
```

</div>

### Level1

La classe *Level1* estende la classe *Level* e si occupa di gestire il
primo livello del gioco. Si limita ad aggiungere le varie componenti del
livello, ereditando la logica di aggiornamento dalla classe *Level*.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Level1.pde).

### Level2

La classe *Level2* estende la classe *Level* e si occupa di gestire il
primo livello del gioco. Si limita ad aggiungere le varie componenti del
livello, ereditando la logica di aggiornamento dalla classe *Level*.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Level2.pde).

### Level3

La classe *Level3* estende la classe *Level* e si occupa di gestire il
primo livello del gioco. Si limita ad aggiungere le varie componenti del
livello, ereditando la logica di aggiornamento dalla classe *Level*.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Level3.pde).

### Timer

La classe *Timer* si occupa di gestire la misurazione degli intervalli
intervalli di tempo nel gioco. È possibile controllare il tempo passato
dall’avvio del timer, il suo stato e gestire la sua reimpostazione.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Timer.pde).

### Text

La classe *Text* si occupa di gestire il testo nel gioco. Include
parametri per la posizione, il colore del font, la dimensione del testo,
il tipo di carattere e l’allineamento. Il testo da mostrare a schermo
viene gestito come *StringBuilder*, oggetto che permette il passaggio
per riferimento.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Text.pde).

### Sound

La classe *Sound* si occupa di gestire i suoni nel gioco. Sfrutta la
libreria per la gestione del suono fornita da Processing, e mette a
disposizione metodi per l’avvio, il loop, la pausa e lo stop. Permette,
inoltre, di regolare il volume e di controllare lo stato di
riproduzione.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Sound.pde).

### Key

La classe *Key* si occupa della gestione dei tasti della tastiera.
Gestisce la pressione e il rilascio del tasto, identificandolo
attraverso un keyCode.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Key.pde).

### Platforms

Il file *Platforms* contiene alcuni metodi globali utilizzati per
semplificare la creazione e l’aggiunta delle piattaforme all’interno dei
livelli. Questi metodi rappresentano un’interfaccia ridotta e pratica
per istanziare quei blocchi presenti in quantità notevoli all’interno
del gioco.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Platforms.pde).

### Global

Il file *Global* contiene la maggior parte delle costanti globali
presenti all’interno del gioco. Esse contengono infromazioni riguardanti
alcuni attributi generici del remake, il percorso degli assets e alcuni
parametri utilizzati nella fisica del gioco.  
Il codice è accessibile
[qui](https://github.com/Manuel06p/super_mario_bros._-_processing_remake/blob/main/Global.pde).

# Riflessioni e sviluppo futuro

La creazione di questo remake è stato un progetto al quale mi sono
dedicato con entusiasmo ed impegno, e posso considerarmi soddisfatto del
risultato ottenuto fino ad ora. Lo sviluppo mi ha messo davanti a
moltissime difficoltà come la gestione delle collisioni con le
tolleranze o la gestione della fisica di gioco, ma aver risolto queste
sfide affinando le soluzioni con tentativi e ragionamento è stato più
che mai stimolante e formativo. Sento di aver maturato, grazie alla
creazione di questo progetto, un nuovo livello di competenze nella
programmazione ad oggetti e nello sviluppo di videogiochi.  
Ci sono molti aspetti e meccaniche del gioco che non sono riuscito ad
aggiungere, ma sono motivato a continuare questo percorso, evolvendo
sempre di più quello che ho creato. Tra gli aspetti che mi piacerebbe
implementare nel prossimo futuro, rientrano sicuramente i tubi di
teletrasporto ai livelli sotterranei, l’aggiunta di più nemici e la
meccanica del nuoto. Mi piacerebbe anche continuare ad affinare la mia
abilità nel level design, che sicuramente era ed è uno dei punti di
forza della saga di Super Mario.  
Ringrazio il prof. Fabio Barosi per avermi introdotto a questo nuovo
linguaggio di programmazione e avermi supportato nel corso del progetto.
Senza di lui o senza Miyamoto questa idea non avrebbe mai potuto
prendere vita.  

# Fonti

-   Google (motore di ricerca)
-   
-   Chat GPT

-   Processing

-   Nintendo

-   GitHub

-   Stack Overflow

-   Wikipedia

-   The Mushroom Kingdom

-   VideoGameSprites.net

-   MarioUniverse.com

-   Super Mario Bros. - Overworld (Main Theme) \[Remix\] by Qumu

-   Super Mario Bros. OST Remastered 80s Style by Aqua MIDI
