-- Table pour les services (modelages bien-être, minceur, etc.)
CREATE TABLE IF NOT EXISTS services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    price DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table pour les tarifs spécifiques si les tarifs sont détaillés différemment
CREATE TABLE IF NOT EXISTS tarifs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table pour les contacts envoyés via le formulaire de contact
CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les informations de l'esthéticienne (pour affichage sur la page d'accueil)
CREATE TABLE IF NOT EXISTS about (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO services (category, name, description, image_url, price) VALUES
('Modelage Bien-être', 'Modelage Relaxant', 'Un moment de détente pour relâcher toutes les tensions.', 'images/modelage-relaxant.jpg', 60.00),
('Minceur', 'Soin Minceur', 'Un soin amincissant pour affiner la silhouette.', 'images/soin-minceur.jpg', 80.00),
('Beauté', 'Soin du Visage Éclat', 'Un soin du visage pour un teint lumineux.', 'images/soin-visage-eclat.jpg', 70.00),
('Modelage Bien-être', 'Massage aux pierres chaudes', 'Un massage aux pierres chaudes pour une relaxation profonde.', 'images/massage-pierres-chaudes.jpg', 90.00),
('Minceur', 'Cryothérapie', 'Un traitement par le froid pour réduire les amas graisseux.', 'images/cryotherapie.jpg', 100.00);

INSERT INTO tarifs (service_id, name, price, description, image_url) VALUES
(1, 'Séance 30 min', 35.00, 'Une séance de modelage relaxant de 30 minutes.', 'images/seance-30min.jpg'),
(1, 'Séance 60 min', 60.00, 'Une séance de modelage relaxant de 60 minutes.', 'images/seance-60min.jpg'),
(2, 'Cure 5 séances', 350.00, 'Une cure minceur de 5 séances pour des résultats optimaux.', 'images/cure-5-seances.jpg'),
(4, 'Séance 90 min', 120.00, 'Une séance de massage aux pierres chaudes de 90 minutes.', 'images/seance-90min.jpg'),
(5, 'Séance unique', 100.00, 'Une séance unique de cryothérapie pour un traitement ciblé.', 'images/seance-unique.jpg');

INSERT INTO contacts (first_name, last_name, email, message) VALUES
('John', 'Doe', 'john.doe@example.com', 'Bonjour, je souhaite obtenir plus d\'informations sur vos services de modelage. Merci.'),
('Jane', 'Smith', 'jane.smith@example.com', 'Bonjour, j\'aimerais réserver une séance de soin minceur. Pouvez-vous me contacter ?'),
('Alice', 'Johnson', 'alice.johnson@example.com', 'Bonjour, pourriez-vous m\'indiquer vos disponibilités pour un soin du visage ?'),
('Bob', 'Brown', 'bob.brown@example.com', 'Bonjour, je suis intéressé par vos massages aux pierres chaudes.'),
('Charlie', 'Davis', 'charlie.davis@example.com', 'Bonjour, je voudrais des informations sur la cryothérapie. Merci.');

INSERT INTO about (name, description, image_url) VALUES
('Marie Dupont', 'Esthéticienne passionnée avec plus de 10 ans d\'expérience dans les soins du corps et du visage. Mon objectif est de vous offrir un moment de bien-être personnalisé et adapté à vos besoins.', 'images/marie-dupont.jpg');
