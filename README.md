# Algoritmi per Curve e Superfici di Bézier

## Descrizione del Progetto
Questo progetto, sviluppato per il corso di "Numerical Methods for Graphics", si concentra sull'implementazione e l'analisi di algoritmi per curve e superfici di Bézier, strumenti fondamentali nella grafica computerizzata e nel design per modellare superfici e forme complesse.


## Algoritmi Implementati
### Curve di Bézier
#### Algoritmo di De Casteljau
Metodo ricorsivo per valutare le curve di Bézier, utilizzando l'interpolazione iterativa tra i punti di controllo fino ad ottenere il punto sulla curva.

#### Algoritmo di Degree Elevation
Permette di aumentare il grado di una curva di Bézier senza alterarne la forma, aggiungendo punti di controllo per facilitarne la manipolazione.

#### Algoritmo di Subdivision
Divide una curva di Bézier in due curve di Bézier distinte che ricostruiscono la curva originale.

### Superfici di Bézier
#### Algoritmo di De Casteljau per Superfici
Estensione dell'algoritmo per curve, applicato separatamente per entrambe le direzioni parametriche \(u\) e \(v\).

#### Algoritmo di Degree Elevation per Superfici
Eleva il grado della superficie lungo entrambe le direzioni \(u\) e \(v\), aumentando il numero di punti di controllo senza alterarne la forma geometrica.

#### Algoritmo di Subdivision per Superfici
Divide una superficie di Bézier in quattro superfici più piccole utilizzando l'algoritmo di De Casteljau.


