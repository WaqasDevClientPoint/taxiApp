<?php

namespace App\DataTables;

use App\Models\Billing;
use App\Models\Billings;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class BillingsDataTable extends DataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        return datatables()
            ->of($query)
            ->addColumn('action', function ($users) {
                $edit = '<a href="'.url('admin/edit_corporate_billing/'.$users->id).'" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-pencil"></i></a>&nbsp;';
//                $delete = '<a data-href="'.url('admin/delete_billing/'.$users->id).'" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#confirm-delete"><i class="glyphicon glyphicon-trash"></i></a>&nbsp;';

                return $edit;
            });
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\Billing $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Billings $model)
    {
        $users = DB::Table('billings')->select('billings.*','billings.amount as requested_amount','corporates.name','corporate_wallets.amount as wallet_amount')
            ->join('corporates', 'billings.corporate_id', '=', 'corporates.id')
            ->join('corporate_wallets', 'billings.corporate_id', '=', 'corporate_wallets.corporate_id','left')
            ->where('billing_type','=','pre')->orWhere('billing_type','=','post')
            ->groupBy('billings.id')->orderBy('billings.id','DESC');
        return $users;
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->dom('lBfr<"table-responsive"t>ip')
            ->orderBy(0)
            ->buttons(
                ['csv', 'excel', 'print', 'reset']
            );;
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        return [
            Column::make('name'),
            Column::make('billing_type'),
            Column::make('requested_amount'),
            Column::make('wallet_amount'),
            Column::make('action'),
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'Billings_' . date('YmdHis');
    }
}
