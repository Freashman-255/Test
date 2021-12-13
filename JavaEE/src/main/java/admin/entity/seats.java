package admin.entity;

public class seats {
    private Integer seat_row;
    private Integer seat_col;
    private Integer seat_state;

    public void setSeat_row(Integer seat_row) {
        this.seat_row = seat_row;
    }

    public Integer getSeat_row() {
        return seat_row;
    }

    public void setSeat_col(Integer seat_col) {
        this.seat_col = seat_col;
    }

    public Integer getSeat_col() {
        return seat_col;
    }

    public void setSeat_state(Integer seat_state) {
        this.seat_state = seat_state;
    }

    public Integer getSeat_state() {
        return seat_state;
    }
}
