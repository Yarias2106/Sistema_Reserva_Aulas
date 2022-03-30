import React from 'react';
import '../App'
import '../css/footer.css'

class Footer extends React.Component {
    render() {
        return (
        <footer className='foot'>
            <div className="footer-content">
                <ul className="socials">
                
                    <li><a href="" target="_BLANK"><i className="fab fa-facebook-f"></i></a></li>
                    <li><a href="" target="_BLANK"><i className="fab fa-instagram"></i></a></li>
                    <li><a href="" target="_BLANK"><i className="fab fa-twitter"></i></a></li>
                </ul>
                <h6 className="text-light">Powered by Munay</h6> 
            </div>
        </footer>
        );
    }
}

export default Footer;