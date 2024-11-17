# Les masses atomiques (en g/mol)
mNa = 23
mMg = 24
mAl = 27
mSi = 28
mO = 16
mH = 1

# Les masses molaires des oxydes
MNa2O = 2 * mNa + mO
MMgO = mMg + mO
MAl2O3 = 2 * mAl + 3 * mO
MSiO2 = mSi + 2 * mO
MH2O = 2 * mH + mO

# Les nombres de moles d'oxydes dans le glaucophane
nNa2O = 1
nMgO = 3
nAl2O3 = 1
nSiO2 = 8
nH2O = 1

# Les masses des oxydes
mNa2O = nNa2O * MNa2O 
mMgO = nMgO * MMgO
mAl2O3 = nAl2O3 * MAl2O3
mSiO2 = nSiO2 * MSiO2
mH2O = nH2O * MH2O

# La masse totale du glaucophane
mt = mNa2O + mMgO + mAl2O3 + mSiO2 + mH2O

# Les % poids d'oxyde
wtNa2O = mNa2O / mt * 100
wtMgO = mMgO / mt * 100
wtAl2O3 = mAl2O3 / mt * 100
wtSiO2 = mSiO2 / mt * 100
wtH2O = mH2O / mt * 100

# Impression des résultats
cat("Résultats des calculs :\n")
cat("Masses molaires des oxydes (en g/mol) :\n")
cat(sprintf("- Na2O  : %.2f\n", MNa2O))
cat(sprintf("- MgO   : %.2f\n", MMgO))
cat(sprintf("- Al2O3 : %.2f\n", MAl2O3))
cat(sprintf("- SiO2  : %.2f\n", MSiO2))
cat(sprintf("- H2O   : %.2f\n", MH2O))
cat("\n")

cat("Masses des oxydes (en g) :\n")
cat(sprintf("- Na2O  : %.2f\n", mNa2O))
cat(sprintf("- MgO   : %.2f\n", mMgO))
cat(sprintf("- Al2O3 : %.2f\n", mAl2O3))
cat(sprintf("- SiO2  : %.2f\n", mSiO2))
cat(sprintf("- H2O   : %.2f\n", mH2O))
cat("\n")

cat(sprintf("Masse totale du glaucophane : %.2f g\n\n", mt))

cat("Pourcentages en poids des oxydes (%) :\n")
cat(sprintf("- Na2O  : %.2f%%\n", wtNa2O))
cat(sprintf("- MgO   : %.2f%%\n", wtMgO))
cat(sprintf("- Al2O3 : %.2f%%\n", wtAl2O3))
cat(sprintf("- SiO2  : %.2f%%\n", wtSiO2))
cat(sprintf("- H2O   : %.2f%%\n", wtH2O))
