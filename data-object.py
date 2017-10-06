class data(obejct){
	int x
	int y
	int kelas

	contructor(x,y,kelas)
	{
		this.x = x
		this.y = y
		this.kelas = kelas
	}

	public float jarak(data)
	{
		return sqrt((x-data.x)**2 + (y-data.y)**2)
	}
}