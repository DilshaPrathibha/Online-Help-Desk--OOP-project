<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../partials/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Help Desk</title>
    <script src="./script/fontawe.js" crossorigin="anonymous"></script>
   <style>
   		.container {
		    background-color: rgb(210, 212, 220, 0.7);
		    width: 70rem;
		    height:45rem;
		    margin: 60px auto 60px;
		    border-radius: 15px;
		    padding: 40px 0;
		    display:flex;
		    box-shadow: 0 10px 10px rgba(0,0,0,0.5);
		    justify-content: center;
		}
		.grid-container {
		    display: grid;
		    grid-template-columns: repeat(2, 1fr);
		    gap: 20px;
		    max-width: 1100px;
		    padding: 10px;   
		}
		.grid-item {
		    width: 100%;
		    aspect-ratio: 1 / 0.5; /* Makes it a square */
		    overflow: hidden;
		    background: rgb(229, 231, 236, 0.0);
		    display: flex;
		    align-items: center;
		    justify-content: center;
		}
		.imgc1 {
		    width: 400px;
		    height: 250px;
		    border-radius: 10px;
		    filter: grayscale(50%);
		    transition: 0.6s ease;
		    cursor: pointer;
		}
		.imgc1:hover {
		    transform: scale(1.3);
		    filter: grayscale(0%);
		}
		.grid-item2{
			width: 65%;
		    aspect-ratio: 1 / 0.5; /* Makes it a square */
		    overflow: hidden;
		    background: rgba(150, 154, 168, 0.1);
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    box-shadow: 0 20px 20px rgba(0, 0, 0, 0.5);
            margin-left: 6rem;
            border-radius: 5px;
		}
		.icons1 {
		    display: flex;
		    align-items: left;
		    gap: 36px;
		    font-size: 2rem;   
		}
		.icons1 i {
		    color: #023a71;
		    transition: 0.5s;
		}
		.icons1 i:hover {
		    color: #1c2833;
		    transition: 0.5s;
		}
		.Cheader {
		    text-align: left;
		    margin-left: 20px;
		}
		.topic {
		    color: #003366;    
		}
		.content {
		    color: #023a71;
		}
		.map-container{
			margin-right: 3rem;
		    overflow: hidden;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.5);
            border-radius: 5px;
		}
		.map-container iframe {
            width: 100%;
            height: 100%;
        }
   </style>
</head>
<body>  
        <div class="container">
            <div class="grid-container">
                <div class="grid-item">
                    <img class="imgc1" src="./images/contact.jpg" alt="Image 1">
                </div>

                
                <div class="grid-item">
                    <div class="Cheader">
                        <h1 class="topic">We're here to help </h1><br>
                        <div>
                            <p class="content">Have questions or need assistance? Whether it's related to our services, troubleshooting, or any other inquiries, don't hesitate to reach out. 
                                Our team is ready to assist you through the contact options provided below. Your feedback and inquiries are important to us, 
                                and were committed to offering support in any way we can. </p>
                        </div>
                    </div>
                </div>

                <div class="grid-item2">
                    <div>
                        <h1 class="topic">Follow Us</h1><br>

                        <div class="icons1">
                            <a href="mailto:it23844124@my.sliit.lk"><i class="fa-solid fa-envelope fa-1x"></i></a>
                            <a href="tel:+94741709277"> <i class="fa-solid fa-phone fa-1x"></i></a>
                            <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook fa-1x"></i></a>
                            <a  href="https://x.com/"><i class="fa-brands fa-twitter fa-1x"></i></a>
                        </div>
                    </div>
                </div>                 
                <div class="map-container">
					<iframe 
		                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d496.04117625383344!2d80.54639002930917!3d5.949265943001073!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae138d4871611eb%3A0xb61d2dbf9146d81!2sSLIIT%20Matara%20Center!5e0!3m2!1sen!2slk!4v1728037208477!5m2!1sen!2slk" 
		                allowfullscreen="" loading="lazy" 
		                referrerpolicy="no-referrer-when-downgrade">
		            </iframe>
		        </div>   
            </div>
        </div>
</body>
</html>

<%@ include file="../partials/footer.jsp"%>
