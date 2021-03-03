# W SA i GA jest inna filozofia funkcji_oceniajacej: w SA ma byc jak najmniejsza, w GA ma byc jak najwieksza

# Zeby to zadzialalo, wczesniej trzeba zrobic:
# install.packages("GenSA")
library(GenSA)


# Do zmiennej "poznan" wczytujemy dane z pliku CSV
setwd('/')
poznan <- read.csv(file = 'poznan.csv')

#liczba obos
N <- 65

#plec i wiek
N_WOMAN18 <- 2
N_MAN18 <- 2
N_WOMAN25 <- 9
N_MAN25 <- 8
N_WOMAN40 <- 14
N_MAN40 <- 12
N_WOMAN65 <- 11
N_MAN65 <- 7


#wyksztalcenie
N_PRIMARY <- 9
N_MEDIUM <- 35
N_HIGHER <- 21

#stosunek do zmian kliematu skala 5-stopniowa
NC_1 <- 10
NC_2 <- 2
NC_3 <- 14
NC_4 <- 11
NC_5 <- 28

#osiedle
N_A_1 <- 1
N_A_2 <- 2
N_A_3 <- 1
N_A_4 <- 1
N_A_5 <- 1
N_A_6 <- 2
N_A_7 <- 3
N_A_8 <- 2
N_A_9 <- 1
N_A_10 <- 2
N_A_11 <- 1
N_A_12 <- 1
N_A_13 <- 1
N_A_14 <- 1
N_A_15 <- 1
N_A_16 <- 1
N_A_17 <- 1
N_A_18 <- 2
N_A_19 <- 2
N_A_20 <- 2
N_A_21 <- 1
N_A_22 <- 1
N_A_23 <- 1
N_A_24 <- 3
N_A_25 <- 1
N_A_26 <- 3
N_A_27 <- 1
N_A_28 <- 3
N_A_29 <- 1
N_A_30 <- 1
N_A_31 <- 1
N_A_32 <- 1
N_A_33 <- 1
N_A_34 <- 3
N_A_35 <- 2
N_A_36 <- 1
N_A_37 <- 1
N_A_38 <- 3
N_A_39 <- 2
N_A_40 <- 1
N_A_41 <- 2
N_A_42 <- 2

# ROZMIAR_DANYCH (dla zbioru poznan)
ROZMIAR_DANYCH <- nrow(poznan)

funkcja_oceniajaca <- function(v,b) {
  
  ret <- 0
  
  #zapobieganie duplikatom
  if(any(duplicated(poznan$ID[v]))){
    ret <- 99999999
  }else{
    
    
    
    
    # Liczymy ile jest "man/woman" i zakresy wiekowe
    man18 <- 0
    woman18 <- 0
    man25 <- 0
    woman25 <- 0
    man40 <- 0
    woman40 <- 0
    man65 <- 0
    woman65 <- 0
    
    #liczniki wyksztalcenia
    primary <- 0	
    medium <- 0
    higher <- 0
    
    #liczniki stosunku klimatu
    c1 <- 0
    c2 <- 0
    c3 <- 0
    c4 <- 0
    c5 <- 0
    
    #liczniki osiedla
    a1 <- 0
    a2 <- 0
    a3 <- 0
    a4 <- 0
    a5 <- 0
    a6 <- 0
    a7 <- 0
    a8 <- 0
    a9 <- 0
    a10 <- 0
    a11 <- 0
    a12 <- 0
    a13 <- 0
    a14 <- 0
    a15 <- 0
    a16 <- 0
    a17 <- 0
    a18 <- 0
    a19 <- 0
    a20 <- 0
    a21 <- 0
    a22 <- 0
    a23 <- 0
    a24 <- 0
    a25 <- 0
    a26 <- 0
    a27 <- 0
    a28 <- 0
    a29 <- 0
    a30 <- 0
    a31 <- 0
    a32 <- 0
    a33 <- 0
    a34 <- 0
    a35 <- 0
    a36 <- 0
    a37 <- 0
    a38 <- 0
    a39 <- 0
    a40 <- 0
    a41 <- 0
    a42 <- 0
    
    for (i in 1:length(v)) {
      
      if (poznan$GenderAge[v[i]] == "man18-24") {
        man18 <- man18+1
      } else if (poznan$GenderAge[v[i]] == "woman18-24") {
        woman18 <- woman18+1
      } else if (poznan$GenderAge[v[i]] == "man25-39") {
        man25 <- man25+1
      } else if (poznan$GenderAge[v[i]] == "woman25-39") {
        woman25 <- woman25+1
      } else if (poznan$GenderAge[v[i]] == "man40-64") {
        man40 <- man40+1
      } else if (poznan$GenderAge[v[i]] == "woman40-64") {
        woman40 <- woman40+1
      } else if (poznan$GenderAge[v[i]] == "man65+") {
        man65 <- man65+1
      } else if (poznan$GenderAge[v[i]] == "woman65+") {
        woman65 <- woman65+1
      } else {
        
      }		
      
      if (poznan$Education[v[i]] == "primary") {
        primary <- primary+1
      } else if (poznan$Education[v[i]] == "medium") {
        medium <- medium+1
      } else if (poznan$Education[v[i]] == "higher") {
        higher <- higher+1
      } else {
        
      }
      
      if (poznan$climate[v[i]] == "1") {
        c1 <- c1+1
      } else if (poznan$climate[v[i]] == "2")  {
        c2 <- c2+1
      } else if (poznan$climate[v[i]] == "3")  {
        c3 <- c3+1
      } else if (poznan$climate[v[i]] == "4")  {
        c4 <- c4+1
      } else if (poznan$climate[v[i]] == "5")  {
        c5 <- c5+1
      } 
      
      if (poznan$area[v[i]] == "1") {
        a1 <- a1+1
      }else if(poznan$area[v[i]] == "2") {
        a2 <- a2+1
      }else if(poznan$area[v[i]] == "3") {
        a3 <- a3+1
      }else if(poznan$area[v[i]] == "4") {
        a4 <- a4+1
      }else if(poznan$area[v[i]] == "5") {
        a5 <- a5+1
      }else if(poznan$area[v[i]] == "6") {
        a6 <- a6+1
      }else if(poznan$area[v[i]] == "7") {
        a7 <- a7+1
      }else if(poznan$area[v[i]] == "8") {
        a8 <- a8+1
      }else if(poznan$area[v[i]] == "9") {
        a9 <- a9+1
      }else if(poznan$area[v[i]] == "10") {
        a10 <- a10+1
      }else if(poznan$area[v[i]] == "11") {
        a11 <- a11+1
      }else if(poznan$area[v[i]] == "12") {
        a12 <- a12+1
      }else if(poznan$area[v[i]] == "13") {
        a13 <- a13+1
      }else if(poznan$area[v[i]] == "14") {
        a14 <- a14+1
      }else if(poznan$area[v[i]] == "15") {
        a15 <- a15+1
      }else if(poznan$area[v[i]] == "16") {
        a16 <- a16+1
      }else if(poznan$area[v[i]] == "17") {
        a17 <- a17+1
      }else if(poznan$area[v[i]] == "18") {
        a18 <- a18+1
      }else if(poznan$area[v[i]] == "19") {
        a19 <- a19+1
      }else if(poznan$area[v[i]] == "20") {
        a20 <- a20+1
      }else if(poznan$area[v[i]] == "21") {
        a21 <- a21+1
      }else if(poznan$area[v[i]] == "22") {
        a22 <- a22+1
      }else if(poznan$area[v[i]] == "23") {
        a23 <- a23+1
      }else if(poznan$area[v[i]] == "24") {
        a24 <- a24+1
      }else if(poznan$area[v[i]] == "25") {
        a25 <- a25+1
      }else if(poznan$area[v[i]] == "26") {
        a26 <- a26+1
      }else if(poznan$area[v[i]] == "27") {
        a27 <- a27+1
      }else if(poznan$area[v[i]] == "28") {
        a28 <- a28+1
      }else if(poznan$area[v[i]] == "29") {
        a29 <- a29+1
      }else if(poznan$area[v[i]] == "30") {
        a30 <- a30+1
      }else if(poznan$area[v[i]] == "31") {
        a31 <- a31+1
      }else if(poznan$area[v[i]] == "32") {
        a32 <- a32+1
      }else if(poznan$area[v[i]] == "33") {
        a33 <- a33+1
      }else if(poznan$area[v[i]] == "34") {
        a34 <- a34+1
      }else if(poznan$area[v[i]] == "35") {
        a35 <- a35+1
      }else if(poznan$area[v[i]] == "36") {
        a36 <- a36+1
      }else if(poznan$area[v[i]] == "37") {
        a37 <- a37+1
      }else if(poznan$area[v[i]] == "38") {
        a38 <- a38+1
      }else if(poznan$area[v[i]] == "39") {
        a39 <- a39+1
      }else if(poznan$area[v[i]] == "40") {
        a40 <- a40+1
      }else if(poznan$area[v[i]] == "41") {
        a41 <- a41+1
      }else if(poznan$area[v[i]] == "42") {
        a42 <- a42+1
      }
    }
    
    #do wieku i plci dodana jest waga aby zwiekszyc nacisk na te kryteria
    ret <- ret + (N_MAN18-man18)^2*10 + (N_WOMAN18-woman18)^2*10 + (N_MAN25-man25)^2*10 + (N_WOMAN25-woman25)^2*10 + (N_MAN40-man40)^2*10 + (N_WOMAN40-woman40)^2*10 + (N_MAN65-man65)^2*10 + (N_WOMAN65-woman65)^2*10 + (N_PRIMARY-primary)^2 + (N_MEDIUM-medium)^2 + (N_HIGHER-higher)^2 + (NC_1 -c1)^2 +(NC_2-c2)^2+(NC_3-c3)^2+(NC_4-c4)^2+(NC_5-c5)^2+(N_A_1-a1)^2+(N_A_2-a2)^2+(N_A_3-a3)^2+(N_A_4-a4)^2+(N_A_5-a5)^2+(N_A_6-a6)^2+(N_A_7-a7)^2+(N_A_8-a8)^2+(N_A_9-a9)^2+(N_A_10-a10)^2+(N_A_11-a11)^2+(N_A_12-a12)^2+(N_A_13-a13)^2+(N_A_14-a14)^2+(N_A_15-a15)^2+(N_A_16-a16)^2+(N_A_17-a17)^2+(N_A_18-a18)^2+(N_A_19-a19)^2+(N_A_20-a20)^2+(N_A_21-a21)^2+(N_A_22-a22)^2+(N_A_23-a23)^2+(N_A_24-a24)^2+(N_A_25-a25)^2+(N_A_26-a26)^2+(N_A_27-a27)^2+(N_A_28-a28)^2+(N_A_29-a29)^2+(N_A_30-a30)^2+(N_A_31-a31)^2+(N_A_32-a32)^2+(N_A_33-a33)^2+(N_A_34-a34)^2+(N_A_35-a35)^2+(N_A_36-a36)^2+(N_A_37-a37)^2+(N_A_38-a38)^2+(N_A_39-a39)^2+(N_A_40-a40)^2+(N_A_41-a41)^2+(N_A_42-a42)^2
    
  }
  
  if (b) {
    #prezentacja wynikow
    print( poznan$Code[v] )
    print( cat('man18=', man18, ' woman18=', woman18,'man25=', man25, ' woman25=', woman25,'man40=', man40, ' woman40=', woman40,'man65=', man65, ' woman65=', woman65, ' primary=', primary, ' medium=', medium, ' higher=', higher,' climate1=',c1,' climate2=',c2,' climate3=',c3, ' cliamte4=',c4, ' climate5=',c5,' area1=',a1,' area2=',a2,' area3=',a3,' area4=',a4,' area5=',a5,' area6=',a6,' area7=',a7,' area8=',a8,' area9=',a9,' area10=',a10,' area11=',a11,' area12=',a12,' area13=',a13,' area14=',a14,' area15=',a15,' area16=',a16,' area17=',a17,' area18=',a18,' area19=',a19,' area20=',a20,' area21=',a21,' area22=',a22,' area23=',a23,' area24=',a24,' area25=',a25,' area26=',a26,' are27=',a27,' area28=',a28,' area29=',a29,' area30=',a30,' area31=',a31,' area32=',a32,' area33=',a33,' area34=',a34,' area35=',a35,' area36=',a36,' area37=',a37,' area38=',a38,' area39=',a39,' area40=',a40,' area41=',a41,' area42=',a42) )
   #zapis wynikow do pliku
    write.csv(cbind(poznan$ID[v],poznan$Code[v]),'wynik.csv',row.names = FALSE)
  }
  
  ret
}


# Funkcja oceniajaca bedzie sluzyla do optymalizacji rozwiazania. Chcemy, zeby miala jak najnizsza wartosc.
# Argumentem jest wektor danych (lista ID osob) - poniewaz nam chodzi o zbior 65 osob, wiec poprzez wartosc funkcji
# musimy wykluczyc wektory, gdzie ID sie powtarzaja (damy im bardzo wysoka wartosc). 
# Przyjmiemy, ze ciag elementow wektora (czyli ID osob) musi byc rosnacy (co nam zapewnia roznowartosciowosc).

# Bez "as.numeric" wywraca sie z komunikatem "REAL() can only be applied..."
WYNIK <- GenSA(par=as.numeric(sample(1:N)*ROZMIAR_DANYCH/N), fn=funkcja_oceniajaca, lower=as.numeric(seq(1,N)), upper=as.numeric(seq(ROZMIAR_DANYCH-N+1,ROZMIAR_DANYCH)), FALSE, control=list(max.time=1440,smooth=FALSE,verbose=TRUE,temperature=50.0))
print(WYNIK)

#wynik
funkcja_oceniajaca(WYNIK$par, TRUE)
