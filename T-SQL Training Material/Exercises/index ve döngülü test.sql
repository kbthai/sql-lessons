  declare
  @sayi int
  begin
  set @sayi = 0;
		while(@sayi < 100000)
		begin
			
			insert into Region
			values(PI()+' '+RAND()*PI())
			set @sayi = @sayi+1;
		end 
		
  end 
  SELECT * FROM Region


  CREATE INDEX IX_Region --index ad�
  ON Region (RegionDescription);--tablo ve index alan�



