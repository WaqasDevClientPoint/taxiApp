<?php

namespace App\DataTables;

use App\Models\Group;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class GroupsDataTable extends DataTable
{
    protected $edit,$delete;

    public function dataTable($query)
    {
        return datatables()
            ->of($query)

            ->addColumn('action', function ($users) {
                $edit = '<a href="'.url('corporate/edit_group/'.$users->id).'" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-pencil"></i></a>&nbsp;';
                $delete = '<a data-href="'.url('corporate/delete_group/'.$users->id).'" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#confirm-delete"><i class="glyphicon glyphicon-trash"></i></a>&nbsp;';

                return $edit.$delete;
            });
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\Group $model
     * @return \Illuminate\Database\Query\Builder
     */
    public function query(Group $model)
    {
        $users = DB::Table('groups')->select('*')->where('corporate_id',auth('corporate')->id())->groupBy('id');
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
            Column::make('description'),
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
        return 'Groups_' . date('YmdHis');
    }
}
