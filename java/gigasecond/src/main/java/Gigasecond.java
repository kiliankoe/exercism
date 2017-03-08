import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class Gigasecond {
    private LocalDateTime birthday;
    public Gigasecond(LocalDate date) {
        this.birthday = LocalDateTime.of(date, LocalTime.of(0, 0));
    }

    public Gigasecond(LocalDateTime date) {
        this.birthday = date;
    }

    public LocalDateTime getDate() {
        return birthday.plusSeconds(1_000_000_000);
    }
}
