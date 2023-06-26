use QLNhanSu

Create table PhongBan(
	IdPB int primary key not null identity (1,1),
	TenPhong nvarchar (50) not null,
	SDT varchar (10),
);
Create table ChucVu (
	IdCV int primary key not null identity (1,1),
	TenCV nvarchar (20) not null,
	LuongCB float not null,
);
Create table PhuCap (
	IdPC int primary key not null identity (1,1),
	TenPC nvarchar (50),
	TienPC float,
);
Create table NhanVien (
	IdNV int primary key not null identity (1,1),
	HoTen nvarchar (50) not null,
	Email varchar (100) not null,
	Password varchar (100) not null,
	IsAdmin bit default 0,
	SDT varchar (10) not null,
	GioiTinh bit not null,
	NgaySinh date not null,
	QueQuan nvarchar(50) not null,
	DanToc nvarchar (20)not null,
	IdPB int not null,
	IdCV int not null,
	IdPC int default 1,
	TrinhDoHV nvarchar (20) not null,
	--LuongCB float not null,
	CONSTRAINT fk_PhongBan foreign key (IdPB) references PhongBan (IdPB),
	CONSTRAINT fk_ChucVu foreign key (IdCV) references ChucVu (IdCV),
	CONSTRAINT fk_PhuCap foreign key (IdPC) references PhuCap (IdPC),
);

Create table TT_BaoHiem (
	IdBH int primary key not null identity (1,1),
	IdNV int,
	TenBH nvarchar (50),
	TyLeBH float,
	NgayHL date,
	NgayHetHL date,
	TienBH float,--Tiền bảo hiểm (sẽ lấy lương cơ bản của nhân viên từ chức vụ để * với phần trăm bảo hiểm 
	CONSTRAINT fk_NhanVienBH foreign key (IdNV) references NhanVien (IdNV),
);
Create table TTChamCong (
	IdCC int primary key not null identity (1,1),
	IdNV int,
	NgayCC date,
	TVao datetime,
	TRa datetime,
	ViPham bit default 0,
	CONSTRAINT fk_NhanVienCC foreign key (IdNV) references NhanVien (IdNV), 
);
Create table HopDong (
	IdHD int primary key not null identity (1,1),
	IdNV int,
	TenHD nvarchar (100),
	TuNgay date,
	DenNgay date,
	CONSTRAINT fk_NhanVienHD foreign key (IdNV) references NhanVien (IdNV),
);
drop table HopDong
drop table TTChamCong
drop table TT_BaoHiem
drop table NhanVien
drop table ChucVu
drop table PhongBan

--Phòng Ban
insert into PhongBan(TenPhong) values (N'Phòng Nhân Sự');
insert into PhongBan(TenPhong) values (N'Phòng Kế Toán');
insert into PhongBan(TenPhong) values (N'Phòng Kinh Doanh');
insert into PhongBan(TenPhong) values (N'Phòng Kỹ Thuật');
insert into PhongBan(TenPhong) values (N'Phòng Hành Chính');
insert into PhongBan(TenPhong) values (N'Phòng IT');
--Chức Vụ
insert into ChucVu(TenCV,LuongCB) values (N'Nhân Viên',5000);
insert into ChucVu(TenCV,LuongCB) values (N'Trưởng Nhóm',10000);
insert into ChucVu(TenCV,LuongCB) values (N'Giám Sát',16000);
insert into ChucVu(TenCV,LuongCB) values (N'Chuyên Viên',12000);
insert into ChucVu(TenCV,LuongCB) values (N'Trưởng Phòng',25000);

 --Phụ Cấp
 insert into PhuCap values (N'Không Cấp Phụ Cấp',0);
 insert into PhuCap values (N'Phụ Cấp đi lại',800);
 --Nhân Viên
 insert into NhanVien values (N'Nguyễn Văn An','nguyenvanan@gmail.com','123456',1,'0975463335',1,'1990-05-09',57,N'Kinh',N'Quản Trị Nhân Lực',1,6,N'Đại Học');
 insert into NhanVien values (N'Trần Thanh Vân','tranthanhvan@gmail.com','123456',0,'0335467862',0,'1995-03-25',37,N'Kinh',N'Quản Trị Kinh Doanh',1,1,N'Cao Đẳng');
 insert into NhanVien values (N'Bùi Ngọc Trân','buingoctran@gmail.com','123456',0,'0755456824',0,'2000-06-24',12,N'Kinh',N'Công Nghệ Thông Tin',6,2,N'Cao Đẳng');

 create proc sp_TongNgayCong(
		@IdNV int,
		@ThangCong int
)
as
SELECT COUNT(*) FROM TTChamCong where MONTH(NgayCC)= @ThangCong and IdNV = @IdNV GROUP BY MONTH(NgayCC)

create proc sp_TinhLuong (
	@IdNV int ,
	@ThangCong int
)
as
begin 
	declare @Luong float ,@NgayCong int,@SoVPham int,@TienPC float,@LuongCB float
	set @NgayCong = (SELECT COUNT(*)  FROM ChamCong where MONTH(NgayChamCong)= @ThangCong and IdNV = @IdNV GROUP BY MONTH(NgayChamCong))
	set @SoVPham = (SELECT COUNT(*)  FROM TTChamCong where MONTH(NgayCC)= @ThangCong and IdNV = @IdNV and ViPham = 1 GROUP BY MONTH(NgayCC))
	set @TienPC = (Select pc.TienPC from NhanVien nv ,PhuCap pc where nv.IdPC =pc.IdPC )  
	set @LuongCB = (Select cv.LuongCB from NhanVien nv ,ChucVu cv where nv.IdCV =cv.IdCV )  
	set @Luong = ((select @LuongCB/26 from NhanVien where IdNV = @IdNV) * @NgayCong - 30*@SoVPham + @TienPC)
	select Round(@Luong,3) as TongLuong
end
 create proc sp_TongViPham(
		@IdNV int,
		@ThangCong int
)
as
SELECT COUNT(*)  FROM TTChamCong where MONTH(NgayCC)= @ThangCong and IdNV = @IdNV and ViPham = 1 GROUP BY MONTH(NgayCC)
