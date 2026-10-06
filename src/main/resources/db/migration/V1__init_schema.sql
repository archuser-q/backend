CREATE TABLE users (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name     VARCHAR(100) NOT NULL,
    email         VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone         VARCHAR(20),
    role          VARCHAR(20)  NOT NULL,
    created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE venues (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    owner_id    BIGINT       NOT NULL,
    name        VARCHAR(150) NOT NULL,
    address     VARCHAR(255) NOT NULL,
    district    VARCHAR(100) NOT NULL,
    description TEXT,
    image_url   VARCHAR(500),
    created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_venues_owner FOREIGN KEY (owner_id) REFERENCES users (id),
    INDEX idx_venues_district (district)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE courts (
    id                  BIGINT AUTO_INCREMENT PRIMARY KEY,
    venue_id            BIGINT         NOT NULL,
    name                VARCHAR(100)   NOT NULL,
    type                VARCHAR(20)    NOT NULL,
    base_price_per_hour DECIMAL(12, 2) NOT NULL,
    active              BOOLEAN        NOT NULL DEFAULT TRUE,
    created_at          DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_courts_venue FOREIGN KEY (venue_id) REFERENCES venues (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE price_rules (
    id             BIGINT AUTO_INCREMENT PRIMARY KEY,
    court_id       BIGINT         NOT NULL,
    day_type       VARCHAR(20)    NOT NULL,
    start_hour     INT            NOT NULL,
    end_hour       INT            NOT NULL,
    price_per_hour DECIMAL(12, 2) NOT NULL,
    created_at     DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_price_rules_court FOREIGN KEY (court_id) REFERENCES courts (id),
    CONSTRAINT chk_price_rules_hour CHECK (start_hour >= 0 AND end_hour <= 24 AND start_hour < end_hour)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE bookings (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    court_id    BIGINT         NOT NULL,
    customer_id BIGINT         NOT NULL,
    start_time  DATETIME       NOT NULL,
    end_time    DATETIME       NOT NULL,
    total_price DECIMAL(12, 2) NOT NULL,
    status      VARCHAR(20)    NOT NULL,
    note        VARCHAR(255),
    created_at  DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_bookings_court FOREIGN KEY (court_id) REFERENCES courts (id),
    CONSTRAINT fk_bookings_customer FOREIGN KEY (customer_id) REFERENCES users (id),
    CONSTRAINT chk_bookings_time CHECK (start_time < end_time),
    INDEX idx_bookings_court_time (court_id, start_time, end_time),
    INDEX idx_bookings_customer (customer_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;