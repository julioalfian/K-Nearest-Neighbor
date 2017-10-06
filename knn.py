from knn import Data as Data
from operator import itemgetter
import xlrd

start_row = 4
start_column = 1

dataset = xlrd.open_workbook('ruspini.xls')
dataset = dataset.sheet_by_name('Sheet1')

datasetlisttmp = []
datasetlistsetiapkelas = []
datasetuntukcoba = []
datasetlist = []
jenis_kelas = []
jarak = []
voting = []
data_benar = 0
data_salah = 0

x = start_row

knn = int(input('Masukan jumlah baris knn: '))

#membaca file excel kedalam array.
#
for x in range(start_row,dataset.nrows):
    data = Data(dataset.cell(x,1).value,dataset.cell(x,2).value,dataset.cell(x,3).value) #memasukkan data kedalam objeck menggunakan constructornya
    datasetlist.append(data) #array datalist berisi array of object dari object data
    if data.kelas not in jenis_kelas:
        jenis_kelas.append(data.kelas) #array untuk menyimpan jenis kelas

#jeniskelas = [1.0,2.0,3.0,4.0]
#datasetlist = [data,data,data,data,data,data,data.......,data] 75 baris

#looping untuk memsisahkan datalist menjadi datalistsetiapkelas
for x in range(0,len(jenis_kelas)):
    for y in range(0,len(datasetlist)):
        if datasetlist[y].kelas == jenis_kelas[x]:
            datasetlisttmp.append(datasetlist[y])
            #datasetlisttmp = [data,data,data,data] tapi berbeda untuk setiap kelas
    datasetlistsetiapkelas.append(datasetlisttmp)
    datasetlisttmp = []

#datasetlistsetiapkelas = [[data,data,data,data,data ...],[data,data,data,data, ...],[data,data,data,data, ...] ,[data,data,data,data, ...] ]

#looping untuk menghitung 80%
for x in range(0,len(jenis_kelas)):
    for y in range(0,int(0.2*len(datasetlistsetiapkelas[x]))):
        datasetuntukcoba.append(datasetlistsetiapkelas[x].pop())

#isi dari setiap kelas pada datalistsetiapkelas sudah berkurang sebanyak 20%
#datasetuntukcoba = [data,data,data,data,data,data,data,data ,..... ]

datasetlist = []
#menggabungkan datasetlist
for x in range(0,len(jenis_kelas)):
    for y in range(0,len(datasetlistsetiapkelas[x])):
        datasetlist.append(datasetlistsetiapkelas[x][y])

#datasetlist = [data,data,data] >> 61 data
#datasetuntukcoba = [data,data,data,data} >> 15 data

for x in range(0,len(datasetuntukcoba)):
    jarak = []
    for y in range(0,len(datasetlist)):
        jarak.append([y, datasetuntukcoba[x].jarak(datasetlist[y])])
        # [id_data_setlist,jarak]
        # JARAK = [[0,213123],[1,2132423],[2,231423432],[3,12312312312]]

    jarak.sort(key=itemgetter(1))
    jarak = jarak[:knn]
    jenis_kelas = []

    #voting
    voting = []
    for y in range(0,len(jarak)):
        if datasetlist[jarak[y][0]].kelas not in jenis_kelas:
            jenis_kelas.append(datasetlist[jarak[y][0]].kelas)
            voting.append([datasetlist[jarak[y][0]].kelas,0])
            #vting [[jeniskelas, jumlah],[jeniskelas,jumlah]]

    for y in range(0,len(jarak)):
        for z in range(0,len(jenis_kelas)):
            if datasetlist[jarak[y][0]].kelas == jenis_kelas[z]:
                voting[z][1] += 1
                break

    #voting[[1.0 => 5],[2.0,17]]
    voting.sort(key=itemgetter(1),reverse)
    
    
    print("Data :")
    print("X :" + str(datasetuntukcoba[x].x))
    print("Y :" + str(datasetuntukcoba[x].y))
    print("Kelas:" + str(datasetuntukcoba[x].kelas))
    print("")
    print("Setelah dihitung menggunakan algoritma NN menghasilkan nilai")
    print("Kelas:" + str(voting[0][0]))
    if datasetuntukcoba[x].kelas == voting[0][0]:
        data_benar += 1
        print("Data benar")
    else:
        data_salah += 1
        print("Data salah")
    print("")

print("Data benar : " + str((data_benar/(data_salah+data_benar))*100) + "%")