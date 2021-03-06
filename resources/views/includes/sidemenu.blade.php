<section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="{{url('images/logo.png')}}" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Admin</p>
        </div>
      </div>
      
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>{{ session()->get('user') }}
           </a>
        </li>


        <li class="treeview">
        <a href="#">
            <i class="fa fa-table"></i> <span>Master Barang</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{url('/barang')}}"><i class="fa fa-circle-o"></i>Daftar Barang</a></li>
            <li><a href="{{url('/jasa')}}"><i class="fa fa-circle-o"></i>Daftar Jasa</a></li>
            <li><a href="{{url('/mastersparepart')}}"><i class="fa fa-circle-o"></i>Master Spare Part</a></li>
            <li><a href="{{url('/kategori')}}"><i class="fa fa-circle-o"></i>Kategori Barang</a></li>
            <li><a href="{{url('/stokopname')}}"><i class="fa fa-circle-o"></i>Stok Opname</a></li>
          </ul>
        </li>
        <li class="treeview">
        <a href="#">
            <i class="fa fa-table"></i> <span>Master Administrasi</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{url('/supplier')}}"><i class="fa fa-circle-o"></i>Supplier</a></li>
            <li><a href="{{url('/pelanggan')}}"><i class="fa fa-circle-o"></i>Customer</a></li>
            <li><a href="{{url('/mekanik')}}"><i class="fa fa-circle-o"></i>Mekanik</a></li>
            <li><a href="{{url('/lift')}}"><i class="fa fa-circle-o"></i>Lift</a></li>
            <li><a href="{{url('/motor')}}"><i class="fa fa-circle-o"></i>Motor</a></li>
            <li><a href="{{url('/user')}}"><i class="fa fa-circle-o"></i>User</a></li>
            <li><a href="{{url('/setting')}}"><i class="fa fa-circle-o"></i>Setting</a></li>
          </ul>
        </li>
        <li class="treeview">
        <a href="#">
            <i class="fa fa-table"></i> <span>Transaksi</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{url('/pembelian')}}"><i class="fa fa-circle-o"></i>Pembelian</a></li>
            <li><a href="{{url('/grandbeli')}}"><i class="fa fa-circle-o"></i>Grand Beli</a></li>
            <li><a href="{{url('/penjualan')}}"><i class="fa fa-circle-o"></i>Penjualan</a></li>
            <li><a href="{{url('/grandjual')}}"><i class="fa fa-circle-o"></i>Grand Jual</a></li>
            <li><a href="{{url('/returpembelian')}}"><i class="fa fa-circle-o"></i>Retur Pembelian</a></li>
            <li><a href="{{url('/returpenjualan')}}"><i class="fa fa-circle-o"></i>Retur Penjualan</a></li>
          </ul>
        </li>
        <li>
          <a href="{{url('/liveorder')}}">
            <i class="fa fa-calendar"></i> <span>Live Order</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> <span>Laporan</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{url('/laporanpenjualan')}}"><i class="fa fa-circle-o"></i>Lap. Penjualan</a></li>
            <li><a href="{{url('/laporanpenjualanjasa')}}"><i class="fa fa-circle-o"></i>Lap. Penjualan Jasa</a></li>
            <li><a href="{{url('/laporanpenjualanbulanan')}}"><i class="fa fa-circle-o"></i>Lap. Penjualan Bulanan</a></li>
            <li><a href="{{url('/laporangrandjual')}}"><i class="fa fa-circle-o"></i>Lap. Grand Jual</a></li>
            <li><a href="{{url('/laporangrandbeli')}}"><i class="fa fa-circle-o"></i>Lap. Grand Beli</a></li>
            <li><a href="{{url('/laporanpembelian')}}"><i class="fa fa-circle-o"></i>Lap. Pembelian</a></li>
            <li><a href="{{url('/laporanpiutang')}}"><i class="fa fa-circle-o"></i>Lap. Piutang</a></li>
            <li><a href="{{url('/laporanhutang')}}"><i class="fa fa-circle-o"></i>Lap. Hutang</a></li>
            <li><a href="{{url('/laporanstokopname')}}"><i class="fa fa-circle-o"></i>Lap. Stok Opname</a></li>
            <li><a href="{{url('/laporanlaba')}}"><i class="fa fa-circle-o"></i>Lap. Laba</a></li>
          </ul>
        </li>
        
      </ul>
    </section>
    <!-- /.sidebar -->