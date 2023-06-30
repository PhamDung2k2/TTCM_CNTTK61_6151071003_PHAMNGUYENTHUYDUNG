Create database QLNhanSu

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
	GioiTinh bit default 1,
	NgaySinh date ,
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

Create table TTBaoHiem (
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
	TVao time,
	TRa time,
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


--Phòng Ban
insert into PhongBan(TenPhong,SDT) values (N'Phòng Nhân Sự','18005291');
insert into PhongBan(TenPhong,SDT) values (N'Phòng Kế Toán','18005292');
insert into PhongBan(TenPhong,SDT) values (N'Phòng Kinh Doanh','18005293');
insert into PhongBan(TenPhong,SDT) values (N'Phòng Kỹ Thuật','18005294');
insert into PhongBan(TenPhong,SDT) values (N'Phòng Hành Chính','18005295');
insert into PhongBan(TenPhong,SDT) values (N'Phòng IT','18005296');
--Chức Vụ
insert into ChucVu(TenCV,LuongCB) values (N'Nhân Viên',5000);
insert into ChucVu(TenCV,LuongCB) values (N'Trưởng Nhóm',8000);
insert into ChucVu(TenCV,LuongCB) values (N'Giám Sát',12000);
insert into ChucVu(TenCV,LuongCB) values (N'Chuyên Viên',10000);
insert into ChucVu(TenCV,LuongCB) values (N'Trưởng Phòng',16000);

 --Phụ Cấp
 insert into PhuCap values (N'Không Cấp Phụ Cấp',0);
 insert into PhuCap values (N'Phụ Cấp đi lại',800);
 --Nhân Viên
 insert into NhanVien values (N'Nguyễn Văn An','nguyenvanan@gmail.com','3A6C15A1C0479EAB2AC3C2832EA7257BD87CE6DE3A0206BAF94C5F0951DA4FB7',1,'0975463335',1,'1990-05-09',N'Hồ Chí Minh',N'Kinh',1,5,2,N'Kỹ Sư');
 insert into NhanVien values (N'Trần Thanh Vân','tranthanhvan@gmail.com','C1CF024576E9C756B252BD5035EFC64C72C17AFFE236909DED190D266A5BFDF1',0,'0335467862',0,'1995-03-25',N'Long An',N'Kinh',1,1,1,N'Cử Nhân');
 insert into NhanVien values (N'Bùi Ngọc Trân','buingoctran@gmail.com','C1CF024576E9C756B252BD5035EFC64C72C17AFFE236909DED190D266A5BFDF1',0,'0755456824',0,'2000-06-24',N'Ninh Thuận',N'Kinh',6,1,1,N'Cử Nhân');
 --Bảo hiểm

insert into TTBaoHiem(IdNV,TenBH,TyLeBH,NgayHL,NgayHetHL) values (1,N'XH, YT ,TN',0.105,'2023-05-15','2028-05-15');
insert into TTBaoHiem(IdNV,TenBH,TyLeBH,NgayHL,NgayHetHL) values (2,N'XH, YT ,TN',0.105,'2023-05-15','2028-05-15');
insert into TTBaoHiem(IdNV,TenBH,TyLeBH,NgayHL,NgayHetHL) values (3,N'XH, YT ,TN',0.105,'2023-05-15','2028-05-15');

 --Chấm công
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-16','07:50:00','17:05:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-17','08:01:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-18','07:59:00','16:59:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-19','08:59:00','16:59:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-16','07:55:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-17','07:55:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-18','07:55:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-19','07:55:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-16','08:00:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-17','07:55:00','17:00:00');
-- Tháng 5
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-03','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-04','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-04','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-04','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-04','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-04','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-04','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-04','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-05','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-06','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-08','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-09','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-10','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-11','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-11','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-11','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-11','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-11','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-11','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-11','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-12','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-13','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-13','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-13','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-13','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-13','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-13','08:05:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-13','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-15','07:50:00','17:00:00');




insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-16','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-16','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-16','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-16','07:50:00','17:00:00');




insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-17','07:50:00','16:50:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-17','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-17','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-17','07:50:00','17:00:00');



insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-18','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-18','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-18','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-18','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-18','07:50:00','17:00:00');



insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-19','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-19','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-19','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-19','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-19','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-20','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-22','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-23','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-24','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-25','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-25','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-25','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-25','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-25','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-25','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-25','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-26','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-27','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-29','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-30','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-05-31','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-05-31','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-05-31','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-05-31','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-05-31','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-05-31','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-05-31','07:50:00','17:00:00');


-- Tháng 6
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-01','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-01','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-01','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-01','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-01','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-01','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-01','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-02','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-02','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-02','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-02','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-02','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-02','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-02','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-03','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-03','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-05','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-05','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-06','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-06','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-07','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-07','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-07','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-07','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-07','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-07','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-07','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-08','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-08','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-09','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-09','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-10','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-10','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-12','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-12','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-13','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-13','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-13','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-13','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-13','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-13','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-13','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-14','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-14','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-14','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-14','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-14','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-14','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-14','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-15','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-15','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-16','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-16','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-16','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-16','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-16','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-16','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-16','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-17','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-17','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-17','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-17','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-17','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-17','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-17','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-19','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-19','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-19','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-19','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-19','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-19','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-19','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-20','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-20','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-21','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-21','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-21','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-21','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-21','08:10:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-21','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-21','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-22','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-22','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-23','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-23','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-24','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-24','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-26','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-26','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-27','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-27','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-28','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-28','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-28','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-28','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-28','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-28','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-28','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-29','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-29','07:50:00','17:00:00');

insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (1,'2023-06-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (2,'2023-06-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (3,'2023-06-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (4,'2023-06-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (5,'2023-06-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (6,'2023-06-30','07:50:00','17:00:00');
insert into TTChamCong(IdNV,NgayCC,TVao,TRa) values (8,'2023-06-30','07:50:00','17:00:00');



 --Hợp đồng
insert into HopDong values (1,N'Hợp đồng 5 năm','2023-05-15','2028-05-15');

 -- Tạo trigger tự động cập nhật tiền bảo hiểm khi nhập 1 bản ghi 
  Create Trigger tr_BH On TTBaoHiem
for insert,update
AS
	Begin
		Declare @IdBH int
		select @IdBH = IdBH From inserted 
		update TTBaoHiem
		set TienBH = TyLeBH * (select LuongCB From ChucVu cv, NhanVien nv, inserted i where i.IdNV = nv.IdNV and nv.IdCV = cv.IdCV)
		where IdBH = @IdBH
	End
-- Tạo trigger set ViPham = 1 khi nhân viên có thời gian vào trễ hơn 8h hoặc thời gian ra sớm hơn 17h và khi ViPham = 0
	Create Trigger tr_CC On TTChamCong
for insert,update
AS
	Begin
		Declare @TVao time ,@TRa time ,@ViPham bit, @IdCC int
		select @TVao =  TVao From inserted 
		select @TRa =  TRa From inserted 
		select @ViPham =  ViPham From inserted 
		select @IdCC =  IdCC From inserted 
		if (@TVao > '08:00:00' or @TRa < '17:00:00' )
		begin
			update TTChamCong
			set ViPham = 1
			where IdCC = @IdCC and @ViPham = 0
		end
	End
--Proc Tính ngày công của nhân viên 
 create proc sp_TongNgayCong(
		@IdNV int,
		@ThangCong int
)
as
SELECT ISNULL(COUNT(NgayCC), 0) FROM TTChamCong WHERE MONTH(NgayCC) = @ThangCong AND IdNV = @IdNV

--Proc Tính Lương của 1 nhân viên với IdNV và Tháng được nhập từ bàn phím
CREATE PROCEDURE sp_TinhLuong (
    @IdNV int,
    @ThangCong int
)
AS
BEGIN
    DECLARE @Luong float, @NgayCong int, @SoVPham int, @TienPC float, @LuongCB float, @TienBH float

    SELECT @NgayCong = ISNULL(COUNT(NgayCC), 0) 
    FROM TTChamCong 
    WHERE MONTH(NgayCC) = @ThangCong AND IdNV = @IdNV

    SELECT @SoVPham = ISNULL(SUM(CASE WHEN ViPham = 1 THEN 1 ELSE 0 END), 0) 
    FROM TTChamCong 
    WHERE MONTH(NgayCC) = @ThangCong AND IdNV = @IdNV

    SELECT @TienPC = ISNULL((SELECT pc.TienPC FROM NhanVien nv, PhuCap pc WHERE nv.IdPC = pc.IdPC AND nv.IdNV = @IdNV), 0)

    SELECT @LuongCB = ISNULL((SELECT cv.LuongCB FROM NhanVien nv, ChucVu cv WHERE nv.IdCV = cv.IdCV AND nv.IdNV = @IdNV), 0)

    SELECT @TienBH = ISNULL((SELECT TienBH FROM TTBaoHiem WHERE IdNV = @IdNV), 0)

    SET @Luong = ((@LuongCB / 26) * @NgayCong - 30 * @SoVPham + @TienPC - @TienBH)

    SELECT ROUND(@Luong, 3)
END
-- Proc tổng số lần vi phạm của 1 nhân viên trong 1 tháng được nhập từ bàn phím
 create proc sp_TongViPham(
		@IdNV int,
		@ThangCong int
)
as
BEGIN
    SELECT ISNULL(SUM(CASE WHEN ViPham = 1 THEN 1 ELSE 0 END), 0) FROM TTChamCong WHERE MONTH(NgayCC) = @ThangCong AND IdNV = @IdNV
END


