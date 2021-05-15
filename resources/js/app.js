/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))


import VueRouter from 'vue-router';
Vue.use(VueRouter);

import VueAxios from 'vue-axios';
import axios from 'axios';

import App from './App.vue';
Vue.use(VueAxios, axios);

import VueSession from 'vue-session';
Vue.use(VueSession);

import vmodal from 'vue-js-modal';
    Vue.use(vmodal);


import IndexComponent from './components/posts/Index.vue';
import CreateComponent from './components/posts/Create.vue';
import EditComponent from './components/posts/Edit.vue';

import IndexSupComponent from './components/supplier/Index.vue';
import CreateSupComponent from './components/supplier/Create.vue';
import EditSupComponent from './components/supplier/Edit.vue';

import IndexKatComponent from './components/kategori/Index.vue';
import CreateKatComponent from './components/kategori/Create.vue';
import EditKatComponent from './components/kategori/Edit.vue';

import IndexMotorComponent from './components/motor/Index.vue';
import CreateMotorComponent from './components/motor/Create.vue';
import EditMotorComponent from './components/motor/Edit.vue';

import homeComponent from './components/Home.vue';
import liveorder from './components/LiveOrder.vue'
import mekanikComponent from './components/Mekanik.vue';
import jasaComponent from './components/Jasa.vue';
import liftComponent from './components/Lift.vue';

import IndexUserComponent from './components/user/Index.vue';
import CreateUserComponent from './components/user/Create.vue';
import EditUserComponent from './components/user/Edit.vue';

import IndexCustComponent from './components/pelanggan/Index.vue';
import CreateCustComponent from './components/pelanggan/Create.vue';
import EditCustComponent from './components/pelanggan/Edit.vue';

import CreatePembelian from './components/PembelianCreate.vue';
import CreatePenjualan from './components/PenjualanCreate.vue';
import CreateGrandJual from './components/GrandJualCreate.vue';



import LaporanPenjualanComponent from './components/laporan/laporanPenjualan.vue';
import LaporanPenjualanJasaComponent from './components/laporan/laporanPenjualanJasa.vue';
import LaporanPenjualanBulanan from './components/laporan/LaporanPenjualanBulanan.vue';
import LaporanPembelianComponent from './components/laporan/laporanPembelian.vue';
import StokOpnameComponent from './components/laporan/laporanStokOpname.vue';

import ViewStokOpnameComponent from './components/stokOpname/StokOpname.vue';
import InputStokOpnameComponent from './components/stokOpname/StokOpnameCreate.vue';

import InventoriComponent from './components/stokInventori/StokInventori.vue';
import InputInventoriComponent from './components/stokInventori/StokInventoriCreate.vue';

import VueCurrencyFilter from 'vue-currency-filter'
Vue.use(VueCurrencyFilter,
    {
      symbol : 'Rp.',
      thousandsSeparator: '.',
      fractionCount: 0,
      fractionSeparator: ',',
      symbolPosition: 'front',
      symbolSpacing: true
    })

const routes = [
    { name: 'posts', path: '/barang', component: IndexComponent },
    { name: 'create', path: '/barang/create', component: CreateComponent },
    { name: 'edit', path: '/barang/edit/:id', component: EditComponent },
    //supplier
    { name: 'supplier', path: '/supplier', component: IndexSupComponent },
    { name: 'createSupplier', path: '/supplier/create', component: CreateSupComponent },
    { name: 'editSupplier', path: '/supplier/edit/:id', component: EditSupComponent },
    //Kategori
    { name: 'kategori', path: '/kategori', component: IndexKatComponent },
    { name: 'createKategori', path: '/kategori/create', component: CreateKatComponent },
    { name: 'editKategori', path: '/kategori/edit/:id', component: EditKatComponent },
    //======Motor
    { name: 'motor', path: '/motor', component: IndexMotorComponent },
    { name: 'createMotor', path: '/motor/create', component: CreateMotorComponent },
    { name: 'editMotor', path: '/motor/edit/:id', component: EditMotorComponent },
    //=============User
    { name: 'user', path: '/user', component: IndexUserComponent },
    { name: 'createUser', path: '/user/create', component: CreateUserComponent },
    { name: 'editUser', path: '/user/edit/:id', component: EditUserComponent },
    //=============Pelanggan
    { name: 'pelanggan', path: '/pelanggan', component: IndexCustComponent },
    { name: 'createPelanggan', path: '/pelanggan/create', component: CreateCustComponent },
    { name: 'editPelanggan', path: '/pelanggan/edit/:id', component: EditCustComponent },
    //=============Mekanik
    { name: 'mekanik', path: '/mekanik', component: mekanikComponent },
    //=============Jasa
    { name: 'jasa', path: '/jasa', component: jasaComponent },
    //=============Lift
    { name: 'lift', path: '/lift', component: liftComponent },
    //=======Pembelian
    { name: 'pembelian', path: '/pembelian', component: CreatePembelian },
    //=======Penjualan
    { name: 'penjualan', path: '/penjualan', component: CreatePenjualan },
    { name: 'grandjual', path: '/grandjual', component: CreateGrandJual },
    //=======Live Order
    { name: 'liveorder', path: '/liveorder', component: liveorder },
    //=======Laporan
    { name: 'laporanpenjualan', path: '/laporanpenjualan', component: LaporanPenjualanComponent },
    { name: 'laporanpenjualanjasa', path: '/laporanpenjualanjasa', component: LaporanPenjualanJasaComponent },
    { name: 'laporanpenjualanbulanan', path: '/laporanpenjualanbulanan', component: LaporanPenjualanBulanan },
    { name: 'laporanpembelian', path: '/laporanpembelian', component: LaporanPembelianComponent },
    { name: 'laporanstokopname', path: '/laporanstokopname', component: StokOpnameComponent },

    //=========Stok Opname
    { name: 'stokopname', path: '/stokopname', component: ViewStokOpnameComponent },
    { name: 'stokopnamecreate', path: '/stokopnamecreate', component: InputStokOpnameComponent },
    { name: 'stokinventori', path: '/stokinventori', component: InventoriComponent },
    { name: 'stokinventoricreate', path: '/stokinventoricreate', component: InputInventoriComponent },
    //=========Home
    { name: 'home', path: '/', component: homeComponent }
];



const router = new VueRouter({
    mode: 'history',
    routes: routes
});

const app = new Vue(Vue.util.extend({ router }, App)).$mount('#app');

