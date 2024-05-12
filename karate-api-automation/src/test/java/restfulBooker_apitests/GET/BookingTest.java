package restfulBooker_apitests.bookings;

import com.intuit.karate.junit5.Karate;

public class BookingTest {
    
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }    

}

