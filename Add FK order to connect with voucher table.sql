--menambahkan foreign key voucher id pada tabel order agar bisa terhubung dengan tabel voucher

ALTER TABLE tb_orders
ADD CONSTRAINT fk_voucher_id
FOREIGN KEY (voucher_id)
REFERENCES tb_vouchers (voucher_id);


