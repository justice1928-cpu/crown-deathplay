txd = engineLoadTXD ( "Xmastree.txd" )
engineImportTXD ( txd, 834 )
col = engineLoadCOL ( "Xmastree.col" )
engineReplaceCOL ( col, 834 )
dff = engineLoadDFF ( "Xmastree.dff" )
engineReplaceModel ( dff, 834 )
engineSetModelLODDistance(834, 9000)
