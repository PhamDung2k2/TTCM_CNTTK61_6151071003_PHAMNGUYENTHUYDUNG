use QLNhanSu

Create table PhongBan(
	IdPB int primary key not null identity (1,1),
	TenPhong nvarchar (50) not null,
	SDT varchar (10),
);
Create table ChucVu (
	IdCV int primary key not null identity (1,1),
	TenCV nvarchar (20),
);
Create table QueQuan(
	IdQQ int primary key not null identity (1,1) ,
	TenQQ nvarchar (100),
);
Create table NhanVien (
	IdNV int primary key not null identity (1,1),
	HoTen nvarchar (50) not null,
	Email varchar (100) not null,
	Password varchar (100) not null,
	IsAdmin bit not null,
	SDT varchar (10) not null,
	GioiTinh bit not null,
	NgaySinh date not null,
	IdQQ int not null,
	DanToc nvarchar (20)not null,
	ChuyenNganh nvarchar (50) not null,
	IdPB int not null,
	IdCV int not null,
	IdPC int not null,
	TrinhDoHV nvarchar (20) not null,
	LuongCB float not null,
	CONSTRAINT fk_PhongBan foreign key (IdPB) references PhongBan (IdPB),
	CONSTRAINT fk_ChucVu foreign key (IdCV) references ChucVu (IdCV),
	CONSTRAINT fk_QueQuan foreign key (IdQQ) references QueQuan (IdQQ),
	CONSTRAINT fk_PhuCap foreign key (IdPC) references PhuCap (IdPC),
);
Create table PhuCap (
	IdPC int primary key not null identity (1,1),
	TenPC nvarchar (50),
	TienPC float,
);
Create table CaLam (
	IdCL int primary key not null identity (1,1),
	TenCa nvarchar (25),
	TVao time,
	TRa time,

);
Create table TTChamCong (
	IdCC int primary key not null identity (1,1),
	IdNV int,
	Ngay date,
	Thang month,
	Nam year,
	CONSTRAINT fk_NhanVienCC foreign key (IdNV) references NhanVien (IdNV), 
);
Create table HopDong (
	IdHD int primary key not null identity (1,1),
	IdNV int,
	LoaiHD nvarchar (100),
	TuNgay date,
	DenNgay date,
	CONSTRAINT fk_NhanVienHD foreign key (IdNV) references NhanVien (IdNV),
);
